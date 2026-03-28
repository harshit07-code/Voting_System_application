package com.example.demo.dao;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.pojo.Election;
public interface ElectionRepository extends JpaRepository<Election, Integer> {

	@Query("select e from Election e where e.status='ongoing'")
	List<Election> findOngoingElections();
	List<Election> findAll();
List<Election> findByStatus(String string);
Optional<Election> findById(int id);

    void save(String election);
    
	 void deleteById(int id);
	 Election findByElectionName(String electionName);

}
