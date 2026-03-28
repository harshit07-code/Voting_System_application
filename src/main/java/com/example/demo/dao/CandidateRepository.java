package com.example.demo.dao;
import com.example.demo.pojo.*;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.pojo.Candidate;


public interface CandidateRepository extends JpaRepository<Candidate, Integer> {

	
	@Query("select c from Candidate c where c.candidateElectionName= :electionName")
	List<Candidate> showElectionCandidate(@Param("electionName") String electionName); 
	//Dao only define methods that are going to implement in Daoimpl OR service 
  List<Candidate>  findBycandidateElectionName(String string);         // This two declared methods has their implementation in service class
  List<Candidate> findAll();
	/* Candidate findById( int candidateId); */
 
void deleteById( int candidateId);
Optional<Candidate> findById( int candidateId);
List<Candidate> findByElectionOrderByVoteCountDesc(Election election);


/*
 * @Query("select e from candidate e where e.election.electionId = :electionId")
 * List<Candidate> findByElectionId(int electionId);
 */
List<Candidate> findByElection_ElectionId(int electionId);



}
