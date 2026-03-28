package com.example.demo.dao;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.pojo.VoteRecord;
import com.example.demo.pojo.Voter;

import jakarta.transaction.Transactional;

public interface VoteRecordRepository extends JpaRepository<VoteRecord,Integer> {

	@Modifying
    @Transactional
	 @Query("DELETE FROM VoteRecord vr WHERE vr.voter.voterId = :voterId")
	void deleteById(@Param("voterId")UUID voterid);



	boolean existsByVoter_VoterIdAndElection_ElectionId(UUID voterId, int electionId);



	
		
	
	
	} 