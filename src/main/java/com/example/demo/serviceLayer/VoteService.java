package com.example.demo.serviceLayer;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CandidateRepository;
import com.example.demo.pojo.Candidate;

@Service
public class VoteService {
	
@Autowired
private CandidateRepository candidateRepository;


	

  public boolean updateVote(int candidateId) {
	  Optional<Candidate> candidateOpt = candidateRepository.findById(candidateId);
  
  if(candidateOpt.isPresent()) { 
	  Candidate candidate = candidateOpt.get();
  candidate.setVoteCount(candidate.getVoteCount() + 1);
  
  
  candidateRepository.save(candidate);
  return true;
  
  }else { return false; }
  
  }
}
