package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.pojo.Candidate;
import com.example.demo.pojo.Election;
import com.example.demo.serviceLayer.CandidateService;
import com.example.demo.serviceLayer.ElectionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResultController {
	
	@Autowired
	private ElectionService electionService;
	
	@Autowired
	private CandidateService candidateService;
	
	@GetMapping("/viewResults")                                     /* Request came from index page after clicking view result button */
	public String showResults(Model  model) {
		List<Election> elections = electionService.getAllElections();
       model.addAttribute("electionList",elections);
		return "result_page";
	}
	@GetMapping("/showCandidatesForResults")                                                     /* Requests came from multiple pages */
	public String electionCandidates(@RequestParam int electionId, Model model, HttpSession session) {
		
		Election election = electionService.getElectionById(electionId);
		List<Election> elections= electionService.getAllElections();
		model.addAttribute("electionList",elections);
		if("Ongoing".equalsIgnoreCase(election.getStatus())) {
			model.addAttribute("msg", "Election is Currently Ongoing , Results will be displayed after ElectionCompletion");
			session.removeAttribute("candidates");
		model.addAttribute("candidates",null);
			return "result_page";
		}else {
		
			List<Candidate> candidates =  candidateService.getCandidatesForResult(election);

			model.addAttribute("candidates",candidates);
			model.addAttribute("msg",null);
			return "result_page";
			}
	}
	}


