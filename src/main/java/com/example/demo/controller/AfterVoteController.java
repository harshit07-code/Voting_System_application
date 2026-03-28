package com.example.demo.controller;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.pojo.Candidate;
import com.example.demo.pojo.Election;
import com.example.demo.pojo.VoteRecord;
import com.example.demo.pojo.Voter;
import com.example.demo.serviceLayer.CandidateService;
import com.example.demo.serviceLayer.VoteRecordService;
import com.example.demo.serviceLayer.VoterService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AfterVoteController  {
	
	@Autowired
	private CandidateService candidateService;
	
	@Autowired 
	private VoterService voterService;
	
	@Autowired 
	private VoteRecordService voteRecordService;
	
	@PostMapping("/thanksPage")                                                                           /* Request came from Vote_dashboard */
	public String doPost (@RequestParam int candidateId, @RequestParam int electionId, 
			HttpSession session, HttpServletRequest request ,Model model ) {
		try {
		Thread.sleep(5000);
		}catch(Exception e) {
		e.printStackTrace();
	}
                                                       //checking voterId and ELectionId is already in voteRecord if exist then dont record details
			
		Voter voter = (Voter) session.getAttribute("voter");  
	UUID	voterId= voter.getVoterId();
		boolean alreadyVoted =
			         voteRecordService.existsByVoterIdAndElectionId( voterId, electionId);

			 if (alreadyVoted) {
				  model.addAttribute("warning", "Trying to vote Multiple times.");
			     model.addAttribute("msg", "You already voted. Can't vote again.");
			     model.addAttribute("note", "Don't try to vote again and again in the same election");
			     
			     return "AlreadyVotedPage";
			 }else {
			 
		session.setAttribute("candidateId", candidateId);
	    session.setAttribute("electionId", electionId);
	  model.addAttribute("msg","Thanks for voting,Your response is recorded");
	  model.addAttribute("note","Login again to vote in next Election");
	 return "thankspage";	                                                                                      //All data send to thanks page all details submit in database through thankspage 
	}
}
} 