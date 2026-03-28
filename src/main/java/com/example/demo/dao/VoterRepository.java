package com.example.demo.dao;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.pojo.Voter;

public interface VoterRepository extends JpaRepository<Voter,UUID> {
     
    

	 Voter findByEmail(String email);
	 List<Voter>  findAll();
	 Voter save(Voter voter);
	 void deleteById(UUID voterId);
	Optional<Voter>  findById(UUID voterId);
	boolean existsByAadharNo(Long aadharNo);
	boolean existsByEmail(String email);
	
     
}
