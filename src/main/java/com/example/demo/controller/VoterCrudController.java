
package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.example.demo.pojo.User;
import com.example.demo.pojo.Voter;
import com.example.demo.serviceLayer.UserService;
import com.example.demo.serviceLayer.VoteRecordService;
import com.example.demo.serviceLayer.VoterService;

import jakarta.servlet.http.HttpSession;

@Controller
public class VoterCrudController {
	
	
	
@Autowired 
private  VoterService voterService;

@Autowired
private UserService userService;

@Autowired
private VoteRecordService voteRecordService;
	
@PostMapping("/showVoterForm")                                                             /* Post mapping came from admin dashboard */
public String showVoterForms(@RequestParam String button, Model model,HttpSession session ) {
	  List<Voter> voterList= voterService.findAll();
	
		   model.addAttribute("button",button);
		    model.addAttribute("voterList", voterList);
		    
	  return "voter_forms";
		  
	  }
	
	 @GetMapping("/showVoterForm")                                                        // this is get mapping from  the same controller you are in., request also came from admin dashboard .jsp
	    public String showVoterFormGET(Model model, HttpSession session) {

	        String button = (String) session.getAttribute("button");
	        String msg = (String) session.getAttribute("msg");

	        List<Voter> voterList = voterService.findAll();
	        model.addAttribute("voterList", voterList);
	        model.addAttribute("button", button);
	        model.addAttribute("msg", msg);

	        session.removeAttribute("msg");                                                                       // show message only once
	         return "voter_forms";
	         
	    }
	@PostMapping("/registerVoter")                                                                                       //request came from Voter forms
	public String registerVoters(@ModelAttribute  Voter voter ,  @RequestParam("image") MultipartFile image, Model model, HttpSession  session) throws IllegalStateException, IOException {
		if (
			    voter.getName() == null || voter.getName().trim().isEmpty() ||
			    voter.getEmail() == null || voter.getEmail().trim().isEmpty() ||
			    voter.getPassword() == null || voter.getPassword().trim().isEmpty() ||
			    voter.getAadharNo() == null ||
			    voter.getPhoneNO() == null || voter.getPhoneNO().trim().isEmpty() ||
			    voter.getDob() == null ||
			    voter.getAddress() == null || voter.getAddress().trim().isEmpty() ||
			    image == null || image.isEmpty()
			) {
			    session.setAttribute("msg", "You did not fill all required fields. Please fill every field.");
			    session.setAttribute("button", "register");
			    return "redirect:/showVoterForm";
			}

		boolean existss = voterService.existsByEmail(voter.getEmail());
		if(existss) {
			session.setAttribute("msg"," Same email is already present  !" + "\n" + "cannot register voter !");
			session.setAttribute("button","register");
	     	return "redirect:/showVoterForm";
		 }else 
		 {
		   Boolean exists  =voterService.existsByAadharNo(voter.getAadharNo());
		   if(exists) {
			session.setAttribute("msg","Voter is already present With the same Aadhar number !");
			session.setAttribute("button","register");
	     	return "redirect:/showVoterForm";
		   }else 
			   if (!voter.getPhoneNO().matches("\\d{10}")) {
				    session.setAttribute("msg", "Invalid phone number");
					session.setAttribute("button","register");
				    return "redirect:/showVoterForm";
				}else
		   {
			// image path set 
				 String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
				  String uploadPath = "D:/my_voting_project_images/user-images/";
				
				    File file = new File(uploadPath + fileName);
				  
				    if (!file.exists()) {                //   if folder is not there create a folder 
					    file.mkdirs();
					}
				    
				    image.transferTo(file);
					voter.setImagePath(fileName);
			Voter savedVoter = voterService.save(voter);         
			
		
		User user= new User();                           //Whenever Voter register it automatically become user from the below code
		user.setUsername(voter.getEmail());
	   user.setPassword(voter.getPassword());
	   user.setRole("voter");
	   user.setDp("user-images/" + fileName);
	   user.setVoter(voter);
	   userService.save(user);
		session.setAttribute("msg","Voter registered successfully");
		session.setAttribute("button","register");
		return "redirect:/showVoterForm";
		}
		}
		
	}
	
	//@PostMapping("/updateCandidates")
	//public String  updateCandidates(HttpSession session,@RequestParam int candidateId, @RequestParam int userId, @RequestParam("electionId") int electionId, @ModelAttribute Candidate  candidate) {
		
	 // System.out.println("Reached at conttroller");// debug
	   // Election election = electionService.getElectionById(electionId);

	
	    //candidate.setElection(election);
	    
	   // User user= userService.findById(userId);
	    //candidate.setUser(user);
		  //candidateService.save(candidate);
		  //session.setAttribute("msg"," Candidate updated successfully");
		//return "redirect:/candidateForms";
	//}
	
	
	
	
	
	
	
	
	
	@PostMapping("/updateVoter")
	public String updateVoters(@ModelAttribute Voter voter, @RequestParam UUID voterId, HttpSession  session) {
		voterService.save(voter);
		
		  User user= userService.findByVoter( voter);
		 user.setPassword(voter.getPassword());
		 user.setUsername(voter.getEmail());
		 userService.save(user);                                                                        //save the voter with updated details as a user.
		 
		session.setAttribute("msg","Voter Information Updated successfully");
		session.setAttribute("button","update");
		return "redirect:/showVoterForm";
		
	}
	@PostMapping("/updateVoterform")
	public String updateVoterForm(HttpSession session,@RequestParam UUID voterId, @RequestParam String button, Model model) {
		
		//Optional<Voter> voter = voterService.getById( voterId);
		//session.setAttribute("voter", voter);
		Optional<Voter> voterOpt = voterService.getById(voterId);

	    if (voterOpt.isPresent()) {
	        session.setAttribute("voter", voterOpt.get()); // ✅ actual Voter
	    } else {
	        session.setAttribute("msg", "Voter not found");
	    }
		session.setAttribute("button",button);
		  return "redirect:/showVoterForm";
		
	}
	@PostMapping("/removeVoter")                                    // request came from voter_forms
	public String removeVoters(@RequestParam UUID voterId, Model model, HttpSession  session) {
		 List<Voter> voterList = voterService.findAll(); // reload list for table
		    try {
				/* UUID id = UUID.fromString(voterId); */                                  // manually convert
		        voteRecordService.deleteByVoterId(voterId);
		        
		  Optional<Voter> voter=voterService.getById(voterId);
		     if (voter.isPresent()) {
		            String email = voter.get().getEmail(); 
		            userService.deleteByuserName(email);
		        } else {
		          System.out.print("Voter is not found by Id in voterCrud Controller");
		        }
		     voterService.deleteById(voterId);
		        session.setAttribute("msg","Voter deleted successfully");
		    } catch (IllegalArgumentException e) {
		    	session.setAttribute("msg","Wrong voter id, enter correct voter Id");
		    }
			/* session.setAttribute("button","remove"); */
		    session.removeAttribute("msg");
		 return "redirect:/showVoterForm";
	}
		
	@GetMapping("/AdminDashboard")
	public String admindashboard() {
		return "Admin_dashboard";
	}
	
	@GetMapping("/loginPage")
	public String gobackToLogin(HttpSession session) {
		session.invalidate();
		return "login";
	}

}