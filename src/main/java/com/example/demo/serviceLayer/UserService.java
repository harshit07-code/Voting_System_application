package com.example.demo.serviceLayer;


import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.userRepository;
import com.example.demo.pojo.User;
import com.example.demo.pojo.Voter;

import jakarta.transaction.Transactional;

@Service
public class UserService {
	
@Autowired 
private userRepository userRepository;

public boolean checkuserCredentials(String username, String password, String role) {
	
	User user =userRepository.findByUserNameAndPasswordAndRole(username, password, role);
	return user!=null;
}

public User save(User user) {
	return userRepository.save(user);
}

public void deleteById(int userId) {
   userRepository.deleteById(userId);
	
}

public User findById( int userId) {
	
	return userRepository.findById(userId);
}

public List<User> getAll() {
  return userRepository.findAll() ;
}

public User findByUserName(String username) {
	
	return userRepository.findByUserName(username);
}
@Transactional
public void deleteByuserName(String email) {
	userRepository.deleteByUserName(email);
	
}



public User findByVoter(Voter voter) {
	return userRepository.findByVoter(voter);
}







}
