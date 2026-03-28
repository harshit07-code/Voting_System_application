package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.pojo.Candidate;
import com.example.demo.pojo.Election;
import com.example.demo.serviceLayer.CandidateService;
import com.example.demo.serviceLayer.ElectionService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@Controller
public class candidateController {

	@Autowired
private CandidateService candidateService;
	
	@Autowired
	private ElectionService electionService;
	
	@PostMapping("/showCandidates")
	public String showElectionCandidates(HttpServletResponse response, HttpSession session,@RequestParam("electionName") String electionName ,Model model) {
		
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		    response.setHeader("Expires", "0"); // Proxies
		    
		    Election election= electionService.findByElectionName(electionName);
		    session.setAttribute("election", election);

		    // Check if user is logged in
		    if (session.getAttribute("voter") == null) {
		    	 List<Candidate> candidates = candidateService.findBycandidateElectionName(electionName); 
					model.addAttribute("electionName", electionName);
					model.addAttribute("Candidates", candidates);
					
					return "vote_dashboard";
		    //    return "redirect:/login";
		    }
		    List<Candidate> candidates = candidateService.findBycandidateElectionName(electionName); 
			model.addAttribute("electionName", electionName);
			model.addAttribute("Candidates", candidates);
			
			//return "ElectionCandidates";

	   return "vote_dashboard"; // your voter dashboard view
		}
	
		@GetMapping("/showElectionCandidates")                                                     /* Requests came from multiple pages */
	public String electionCandidates(@RequestParam int electionId, Model model) {
		List<Candidate> candidates= candidateService.findByElectionId(electionId);
		model.addAttribute("candidates",candidates);
		List<Election> elections = electionService.getAllElections();

		model.addAttribute("electionList",elections);
		return "candidate_dashboard";
	}
		
	}


