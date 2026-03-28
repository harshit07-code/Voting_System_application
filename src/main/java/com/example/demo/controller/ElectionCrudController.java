package com.example.demo.controller;

import java.util.List;
import java.time.LocalDate; // Added this import
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.pojo.Election;
import com.example.demo.serviceLayer.ElectionService;

@Controller
public class ElectionCrudController {

    private final ElectionService electionService;

    @Autowired
    public ElectionCrudController(ElectionService electionService) {
        this.electionService = electionService;
    }

    @GetMapping("/showCreateform")
    public String showCreateForm(Model model) {
        model.addAttribute("openCreateElectionPage", "create_election.jsp");
        return "create_election";
    }

    @GetMapping("/showAllElectionsOnRemoveform")
    public String showRemoveForm(Model model) {
        List<Election> elections = electionService.getAllElections();
        model.addAttribute("electionList", elections);
        return "remove_election";
    }

    @GetMapping("/showAllElectionsOnUpdateform")
    public String findAllElections(Model model) {
        List<Election> elections = electionService.getAllElections();
        model.addAttribute("electionList", elections);
        return "update_election";
    }

	/*
	 * @PostMapping("/CreateElection") public String ElectionCreated(@RequestParam
	 * String electionName, @RequestParam String startDate,
	 * 
	 * @RequestParam String endDate, @RequestParam String status, Model model) {
	 * 
	 * Election election = new Election(); election.setElectionName(electionName);
	 * 
	 * // Parsing Strings to LocalDate
	 * election.setStartDate(LocalDate.parse(startDate));
	 * election.setEndDate(LocalDate.parse(endDate));
	 * 
	 * election.setStatus(status);
	 * 
	 * electionService.save(election); model.addAttribute("msg",
	 * "Election created successfully"); return "create_election"; }
	 */

    
    @PostMapping("/CreateElection")
    public String ElectionCreated(
            @RequestParam(required = false) String electionName,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate,
            @RequestParam(required = false) String status,
            Model model) {

        // Check for missing fields
        if (electionName == null || electionName.isBlank() ||
            startDate == null || startDate.isBlank() ||
            endDate == null || endDate.isBlank() ||
            status == null || status.isBlank()) {

            model.addAttribute("msg", "Please fill all fields!");  // Error message
            return "create_election";  // Reload the same form
        }

        try {
            Election election = new Election();
            election.setElectionName(electionName);
            
            // Parsing Strings to LocalDate
            election.setStartDate(LocalDate.parse(startDate));
            election.setEndDate(LocalDate.parse(endDate));
            election.setStatus(status);

            electionService.save(election);
            model.addAttribute("msg", "Election created successfully"); // Success message
        } catch (Exception e) {
            model.addAttribute("msg", "Error creating election: " + e.getMessage());
        }

        return "create_election"; // Return form page in all cases
    }
    @PostMapping("/updateElection")
    public String updateElection(@RequestParam String electionName, @RequestParam int electionId, 
                                 @RequestParam String startDate, @RequestParam String endDate, 
                                 @RequestParam String status, Model model) {
        
        Election election = electionService.getElectionById(electionId);
        if (election != null) {
            election.setElectionId(electionId);
            election.setElectionName(electionName);
            
            // Parsing Strings to LocalDate
            election.setStartDate(LocalDate.parse(startDate));
            election.setEndDate(LocalDate.parse(endDate));
            
            election.setStatus(status);
            electionService.save(election);
        }

        model.addAttribute("msg", "Election Updated Successfully");
        return "update_election";
    }

    @PostMapping("/removeElection")
    public String removeElection(@RequestParam int electionId, Model model) {
        electionService.deleteById(electionId);
        model.addAttribute("message", "Election deleted successfully");
        return "remove_election";
    }

    @GetMapping("/backToAdminDashboard")
    public String goBackTOAdminPage() {
        return "Admin_dashboard";
    }
}