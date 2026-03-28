
package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.pojo.Candidate;
import com.example.demo.pojo.Election;
import com.example.demo.pojo.User;
import com.example.demo.serviceLayer.CandidateService;
import com.example.demo.serviceLayer.ElectionService;
import com.example.demo.serviceLayer.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CandidateCrudController {
	
	@Autowired 
	private CandidateService candidateService;
	
	@Autowired
	private ElectionService electionService;
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/candidateForms")
	public String showCandidateForms( @RequestParam String button, Model model) {
		List<Candidate> candidates=candidateService.findAll();
		List<Election> election = electionService.getAllElections();
		model.addAttribute("electionList",election);
		model.addAttribute("candidateList", candidates);
		model.addAttribute("button",button);
		return "candidate_forms";
	}
	
	@GetMapping("/candidateForms")
	public String backToCandidateForms(Model model, HttpSession session, String msg, String button, String candidate) {
		List<Candidate> candidates=candidateService.findAll();
		List<Election> election = electionService.getAllElections();
		model.addAttribute("electionList",election);
		model.addAttribute("candidateList", candidates);
		model.addAttribute("msg",session.getAttribute(msg));
		model.addAttribute("button",session.getAttribute(button));
		model.addAttribute("candidateId", session.getAttribute("candidateId"));
	    model.addAttribute("userId", session.getAttribute("userId"));
	    model.addAttribute("electionId", session.getAttribute("electionId"));
	    model.addAttribute("candidate",session.getAttribute(candidate));
		return "candidate_forms";
	}
	

		@PostMapping("/registerCandidate")
		public String registerCandidates(
		        HttpSession session,
		        @RequestParam(value = "electionId", required = false) Integer electionId,
		        @RequestParam(value = "image", required = false) MultipartFile image,
		        @RequestParam(value = "partyImage", required = false) MultipartFile partyImage,
		        @ModelAttribute Candidate candidate,
		        Model model
		) throws IOException {
			
			if (image == null || image.isEmpty() || partyImage == null || partyImage.isEmpty()) {
			    session.setAttribute("msg", "Please upload candidate photo and party symbol");
			    session.setAttribute("button", "register");
			    return "redirect:/candidateForms";
			}


		if (
			    electionId <= 0 ||
			    candidate.getCandidateName() == null || candidate.getCandidateName().trim().isEmpty() ||
			    candidate.getCandidateAge() <= 0 ||
			    candidate.getPartyName() == null || candidate.getPartyName().trim().isEmpty() ||
			    image == null || image.isEmpty() ||
			    partyImage == null || partyImage.isEmpty()
			) {
			    session.setAttribute("msg", "Please fill all required candidate details");
			    session.setAttribute("button", "register");
			    return "redirect:/candidateForms";
			}


	    Election election = electionService.getElectionById(electionId);
	    candidate.setElection(election);
	    candidate.setCandidateElectionName(election.getElectionName());
	    String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
		  String uploadPath = "D:/my_voting_project_images/user-images/";
		  File file = new File(uploadPath + fileName);
		   if (!file.exists()) {                //   if folder is not there create a folder 
			    file.mkdirs();
			}
		   image.transferTo(file);
			candidate.setImagePath( fileName);  
			String uploadPathforPartyImage = "D:/my_voting_project_images/partySymbol/";
			 File file1 = new File(uploadPathforPartyImage + fileName);
			partyImage.transferTo(file1);
			//candidate.setPartySymbol( candidate.getPartyName() +".jpg");
	    
	    User user = new User();
	    String name = candidate.getCandidateName().trim().replaceAll("\\s+", "");
	    String unique = String.valueOf(System.currentTimeMillis()).substring(9);
	    
	     user.setUsername(name.toLowerCase()+unique);
	     
			String[] nameParts = candidate.getCandidateName().trim().split("\\s+");          /* taking first name for password genration */
	     String firstName = nameParts[0];
	     String lastName = nameParts.length > 1 ? nameParts[1] : "";

	     // Generate random 4-digit number
	     String randomNum = String.valueOf((int)(Math.random() * 9000) + 1000);

	     // Set password as firstName + randomNum + lastName
	     String password = firstName.toLowerCase() + randomNum + lastName.toLowerCase();
	     user.setPassword(password);                   
	     user.setRole("Candidate");
	     user.setDp("user-images/" +fileName);
	     
	    userService.save(user);
	     candidate.setUser(user);
	  candidateService.save(candidate);
	
	
	
	model.addAttribute("msg","Candidate Registered Successfully");
		session.setAttribute("button","register");
		return "redirect:/candidateForms";		
	}
	
	@PostMapping("/updateCandidates")
	public String  updateCandidates(HttpSession session,@RequestParam int candidateId, @RequestParam int userId, @RequestParam("electionId") int electionId, @ModelAttribute Candidate  candidate) {
		
	  System.out.println("Reached at conttroller");// debug
	    Election election = electionService.getElectionById(electionId);

	
	    candidate.setElection(election);
	    
	    User user= userService.findById(userId);
	    candidate.setUser(user);
		  candidateService.save(candidate);
		  session.setAttribute("msg"," Candidate updated successfully");
		return "redirect:/candidateForms";
	}
	
	@PostMapping("/updateCandidateform")
	public String updateCandidateForm(HttpSession session,@RequestParam int candidateId, @RequestParam String button, Model model) {
		
		Candidate candidate = candidateService.getCandidateById(candidateId);
		session.setAttribute("candidate", candidate);
		session.setAttribute("button",button);
		  return "redirect:/candidateForms";
		
	}
	@PostMapping("/removeCandidates")
	public String removeCandidateForm(HttpSession session, @RequestParam String button, @RequestParam int  candidateId, Model model) {
		
		Candidate candidate=candidateService.getCandidateById(candidateId);
		if(candidate!=null) {
			User user= candidate.getUser();
			
			candidate.setUser(null);
			candidateService.save(candidate);
			if(user!=null) {
				userService.deleteById(user.getUserId());
			}
		}
		candidateService.deleteById(candidateId);
		session.setAttribute("msg", "Candidate removed Successfully");
		return "redirect:/candidateForms";

}
	
	@GetMapping("/backToAdminPage")
	public String backToAdminPage() {
		return "Admin_dashboard";
	}
	
}