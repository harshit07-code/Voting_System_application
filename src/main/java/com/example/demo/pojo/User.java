package com.example.demo.pojo;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;

    private String userName;
    private String password;
    private String dp;
    private String role;

    @OneToOne
    @JoinColumn(name = "voter_id", columnDefinition = "BINARY(16)", unique = true)
    private Voter voter;

    @OneToMany(mappedBy = "user")
    private List<VoteRecord> votes;

    @OneToOne(mappedBy = "user")
    private Candidate candidate;

    public User() {}

    public User(int userId, String userName, String password, String dp,
                String role, Voter voter, List<VoteRecord> votes, Candidate candidate) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.dp = dp;
        this.role = role;
        this.voter = voter;
        this.votes = votes;
        this.candidate = candidate;
    }

    // Getters & Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUsername() { return userName; }
    public void setUsername(String userName) { this.userName = userName; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getDp() { return dp; }
    public void setDp(String dp) { this.dp = dp; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public Voter getVoter() { return voter; }
    public void setVoter(Voter voter) { this.voter = voter; }

    public List<VoteRecord> getVotes() { return votes; }
    public void setVotes(List<VoteRecord> votes) { this.votes = votes; }

    public Candidate getCandidate() { return candidate; }
    public void setCandidate(Candidate candidate) { this.candidate = candidate; }

    @Override
    public String toString() {
        return "User [userId=" + userId +
                ", userName=" + userName +
                ", role=" + role +
                ", voterId=" + (voter != null ? voter.getVoterId() : null) +
                ", candidateId=" + (candidate != null ? candidate.getCandidateId() : null) +
                "]";
    }
}
