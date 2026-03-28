package com.example.demo.serviceLayer;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.VoterRepository;
import com.example.demo.pojo.Voter;

@Service
public class VoterService {

	
	@Autowired
	private VoterRepository voterRepository;
	
	public List<Voter> findAll() {
	return voterRepository.findAll();
}

	public Voter  save(Voter voter) {
	return  voterRepository.save(voter );
		
	}

	public void deleteById(UUID voterId) {
		voterRepository.deleteById(voterId);
		
	}

	public Optional<Voter> getById(UUID voterId) {
	return voterRepository.findById(voterId);
	
	}

	

	public boolean existsByAadharNo(Long  aadharNo) {
	return  voterRepository.existsByAadharNo(aadharNo);
	}

	public boolean existsByEmail(String email) {
		return  voterRepository.existsByEmail(email);
	}

	

	
}


