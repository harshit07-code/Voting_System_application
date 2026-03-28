package com.example.demo.controller;
import com.example.demo.serviceLayer.ElectionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.demo.pojo.Election;

@Controller
public class electionController {

@Autowired
private ElectionService electionService;

@GetMapping("/showElections")
	public String  findOngoingElections( Model model){
	List<Election> elections = electionService.getOngoingElections();
	 model.addAttribute("ongoingElections",elections);
		return "Voter_dashboard";
	}


@GetMapping("/showAllElections")
public String  findAllElections( Model model ){
	
    
List<Election> elections = electionService.getAllElections();

model.addAttribute("electionList",elections);

return "candidate_dashboard";


}
}
