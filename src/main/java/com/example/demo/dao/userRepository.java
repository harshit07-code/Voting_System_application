package com.example.demo.dao;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.pojo.*;



@Repository
public interface userRepository extends JpaRepository<User, Integer>{
    User  findByUserNameAndPasswordAndRole (String username, String password, String role);
	
	 User save(User user);

	void deleteById(int userId);
	User findById(int userId);

	User findByUserName(String username);

	void deleteByUserName(String email);
	

	User findByVoter(Voter voter);
}
