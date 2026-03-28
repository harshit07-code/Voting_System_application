package com.example.demo.serviceLayer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.CandidateRepository;
import com.example.demo.pojo.Candidate;
import com.example.demo.pojo.Election;

@Service
public class CandidateService {
	
	@Autowired
	private CandidateRepository candidateRepository;
	
	
	 public  List<Candidate>  findBycandidateElectionName(String electionName){
		return candidateRepository.findBycandidateElectionName(electionName);
			
		}
      public List<Candidate> findAll() {                                              //It will find Candidates from DB
		return candidateRepository.findAll();
		
	 }
 public Candidate save(Candidate candidate) {                              // It will save the candidates in DB
		return candidateRepository.save(candidate);
		
	 } 
 public void deleteById(int candidateId) {                                       //It will delete candidates from DB based on the given candidate Id
		candidateRepository.deleteById(candidateId);
		
	 }

 public Candidate   getCandidateById(int candidateId) {                    // it will return Candidates based on candidateId
		return candidateRepository.findById(candidateId).orElse(null);
	 }


	 public List<Candidate> findByElectionId(int electionId) {             // it will return Candidates based on electionId from DB
	  return candidateRepository.findByElection_ElectionId(electionId);
		
	 }
	 public List<Candidate> getCandidatesForResult(Election election) {
		    return candidateRepository
		           .findByElectionOrderByVoteCountDesc(election);
		}




		
	}

	 

	

