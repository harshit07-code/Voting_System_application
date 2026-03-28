package com.example.demo.controller;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.demo.pojo.Candidate;
import com.example.demo.pojo.Election;
import com.example.demo.pojo.User;
import com.example.demo.pojo.VoteRecord;
import com.example.demo.pojo.Voter;
import com.example.demo.serviceLayer.CandidateService;
import com.example.demo.serviceLayer.ElectionService;
import com.example.demo.serviceLayer.VoteRecordService;
import com.example.demo.serviceLayer.VoteService;
import com.example.demo.serviceLayer.VoterService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LogoutController {
	
@Autowired
private VoteService voteService;

@Autowired
private ElectionService electionService;

@Autowired 
private CandidateService candidateService;

@Autowired
private VoteRecordService voteRecordService;

@Autowired
private VoterService voterService;

@GetMapping("/logout")
public String increaseVote(Model model,HttpSession session) {
	
	int candidateId = (int) session.getAttribute("candidateId");         
	Candidate candidate = candidateService.getCandidateById(candidateId);            /* fetched Candidate object through candidateId */
	Election election = (Election) session.getAttribute("election");

	if (election != null) {
	    int electionId = election.getElectionId();
	}
	

	Voter voters = (Voter) session.getAttribute("voter");                                                   /* Fetched Voter object from session */
	UUID voterId= null;
	if(voters!=null) {
	 voterId =voters.getVoterId();
	}else {
		System.out.println("Voters is null from session  in CandidateController.increaseVote(Method)");
	}
	
	Optional<Voter>  optionalVoter= voterService.getById(voterId);                           /* fetched Voter object through voterId */
	

	VoteRecord voteRecord = new VoteRecord();                                                          /* Storing all records in vote_record tables */
	Voter voter= optionalVoter.get(); 
	voteRecord.setVoter(voter);
	voteRecord.setCandidate(candidate);
	voteRecord.setElection(election);
	User user= (User) session.getAttribute("user");
	voteRecord.setUser(user);
	 voteRecordService.save(voteRecord);
	 
		boolean updated = voteService.updateVote(candidateId);                                           /* checks is vote submitted */
	 
	if(updated) {
		session.invalidate();
		model.addAttribute("message","Your vote successfully submitted");
		return "index";
}else {
	model.addAttribute("message","Vote is not casted try again");
 return "vote_dashboard";	
}
}

@GetMapping("/logoutWithoutVote")                                                 /* Logs out when Someone clicks  logout button */
public String logout(HttpSession session) {
	session.invalidate();
	return "index";
}

}
