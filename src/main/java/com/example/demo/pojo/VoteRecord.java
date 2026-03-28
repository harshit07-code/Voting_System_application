package com.example.demo.pojo;

import java.time.LocalDateTime;
import org.hibernate.annotations.CreationTimestamp;
import jakarta.persistence.*;

@Entity
@Table(name = "vote_record")
public class VoteRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int voteId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = true)
    private User user;

    @ManyToOne
    @JoinColumn(name = "voter_id", columnDefinition = "BINARY(16)", nullable = false)
    private Voter voter;

    @ManyToOne
    @JoinColumn(name = "candidate_id", nullable = false)
    private Candidate candidate;

    @ManyToOne
    @JoinColumn(name = "election_id", nullable = false)
    private Election election;

    @CreationTimestamp
    private LocalDateTime timestamp;

    public VoteRecord() {}

    public VoteRecord(int voteId, User user, Voter voter,
                      Candidate candidate, Election election,
                      LocalDateTime timestamp) {
        this.voteId = voteId;
        this.user = user;
        this.voter = voter;
        this.candidate = candidate;
        this.election = election;
        this.timestamp = timestamp;
    }

    // Getters & Setters
    public int getVoteId() {
        return voteId;
    }

    public void setVoteId(int voteId) {
        this.voteId = voteId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Voter getVoter() {
        return voter;
    }

    public void setVoter(Voter voter) {
        this.voter = voter;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public Election getElection() {
        return election;
    }

    public void setElection(Election election) {
        this.election = election;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "VoteRecord [voteId=" + voteId +
                ", voterId=" + (voter != null ? voter.getVoterId() : null) +
                ", candidateId=" + (candidate != null ? candidate.getCandidateId() : null) +
                ", electionId=" + (election != null ? election.getElectionId() : null) +
                ", timestamp=" + timestamp + "]";
    }
}
