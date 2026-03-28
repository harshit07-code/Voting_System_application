package com.example.demo.serviceLayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ElectionRepository;
import com.example.demo.pojo.Election;

@Service
public class ElectionService {

    @Autowired
    private ElectionRepository electionRepository;


    public List<Election> getOngoingElections() {
        return electionRepository.findByStatus("ongoing");
    }

	public  List<Election> getAllElections() {
		List<Election> elections =electionRepository.findAll();
			return elections;
}
	public Election getElectionById(int id) {
        return electionRepository.findById((int)id).orElse(null);
    }
	
	public void save(Election election) {
		electionRepository.save(election);	
		}

	
	 public void deleteById(int electionId) {
	        electionRepository.deleteById(electionId);
	    }

	 public List<Election> findAll() {
		return electionRepository.findAll();
	 }

	 public Election findByElectionName(String electionName) {
	return	electionRepository.findByElectionName(electionName);
		
	 }

	

	
}