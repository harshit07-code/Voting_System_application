package com.example.demo.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.pojo.Election;
import com.example.demo.serviceLayer.ElectionService;

@Controller
public class TableController {
	

@Autowired
   private   ElectionService  electionService;
	
@GetMapping("/ShowElectionTable")
public String showTable(@RequestParam String showtable ,@RequestParam String page,  Model model) {
	
	if(showtable.equals("true")) {
	List<Election> elections = electionService.findAll();
	model.addAttribute("electionList",elections);
	model.addAttribute("showtable",true);
	}
	return page;
	
}
}

