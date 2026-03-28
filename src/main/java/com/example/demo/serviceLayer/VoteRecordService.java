package com.example.demo.serviceLayer;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.VoteRecordRepository;
import com.example.demo.pojo.VoteRecord;
import com.example.demo.pojo.Voter;


@Service
public class VoteRecordService {
	
	@Autowired
	VoteRecordRepository  voteRecordRepository;

	public void save(VoteRecord voteRecord) {
		voteRecordRepository.save(voteRecord);
		
	}

	public void deleteByVoterId(UUID voterid) {
		voteRecordRepository.deleteById(voterid);
		
	}

	

	

	public boolean existsByVoter_VoterIdAndElection_ElectionId(UUID voterId, int electionId) {
		
		return voteRecordRepository.existsByVoter_VoterIdAndElection_ElectionId(voterId,electionId);
	}

	public boolean existsByVoterIdAndElectionId(UUID voterId, int electionId) {
	
		return voteRecordRepository.existsByVoter_VoterIdAndElection_ElectionId(voterId, electionId);
	}

	

	/*
	 * public void save() { voteRecordRepository.save();
	 * 
	 * }
	 */

}