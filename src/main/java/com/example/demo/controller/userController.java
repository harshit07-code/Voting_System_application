package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.VoterRepository;
import com.example.demo.pojo.User;
import com.example.demo.pojo.Voter;
import com.example.demo.serviceLayer.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class userController {
@Autowired
private  UserService userService;
@Autowired
private VoterRepository voterRepository;

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/checkuser")
	public String checkuserCredentails(@RequestParam String username, @RequestParam String password, @RequestParam String role, Model model, HttpSession session) {
		
		 boolean valid = userService.checkuserCredentials(username, password, role);

		    if (valid) {
		        if (role.equalsIgnoreCase("Voter")) {

		            //  Find voter by voterId
		            Voter voter = voterRepository.findByEmail(username);
		            System.out.println("Voter found at login = " + voter);
		            
		            if (voter == null) {
		                System.out.println("VOTER NOT FOUND USING EMAIL: " + username);
		            }

		            session.setAttribute("voter", voter);

		            if (voter != null) {
		                //  Store voterId in session
		                session.setAttribute("voterId", voter.getVoterId());
		            }

		            //  Store other details in session
		            session.setAttribute("username", username);
		            session.setAttribute("role", role);
		         User user = userService.findByUserName(username);
		         session.setAttribute("user",user);
		         session.setAttribute("Loggedin",user);
                model.addAttribute("username", username);
                 return "redirect:/showElections";

		        } else if (role.equalsIgnoreCase("Candidate")) {

		            session.setAttribute("username", username);
		            session.setAttribute("role", role);
                    model.addAttribute("username", username);
		            User user = userService.findByUserName(username);
			         session.setAttribute("User",user);
			         session.setAttribute("Loggedin",user);
		            return "redirect:/showAllElections";

		        } else if(role.equalsIgnoreCase("Admin")) {
		        	
		        	model.addAttribute("msg", "Welcome Admin");
		        	  User user = userService.findByUserName(username);
				         session.setAttribute("User",user);
				         session.setAttribute("Loggedin",user);
		        	return "Admin_dashboard";
		        }else{
		            model.addAttribute("error", "Invalid role!");
		            return "login";
		        }
		    } else {
		        model.addAttribute("error", "Invalid username or password!");
		        return "login";
		    }
		}
	
	@GetMapping("/indexPage")
	public String goToIndexPage() {
		return "index";
	}
}

