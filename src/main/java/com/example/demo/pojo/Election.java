package com.example.demo.pojo;

import java.time.LocalDate;
import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "election")
public class Election {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "election_id")
    private int electionId;

    private String electionName;

    private LocalDate startDate;
    private LocalDate endDate;

    private String status;

    @OneToMany(mappedBy = "election")
    private List<Candidate> candidates;

    @OneToMany(mappedBy = "election")
    private List<VoteRecord> votes;

    public Election() {}

    public Election(int electionId, String electionName,
                    LocalDate startDate, LocalDate endDate, String status) {
        this.electionId = electionId;
        this.electionName = electionName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    // Getters & Setters
    public int getElectionId() {
        return electionId;
    }

    public void setElectionId(int electionId) {
        this.electionId = electionId;
    }

    public String getElectionName() {
        return electionName;
    }

    public void setElectionName(String electionName) {
        this.electionName = electionName;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Election [electionId=" + electionId +
                ", electionName=" + electionName +
                ", status=" + status + "]";
    }
}
