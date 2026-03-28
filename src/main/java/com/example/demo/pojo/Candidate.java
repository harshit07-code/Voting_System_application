package com.example.demo.pojo;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "candidate")
public class Candidate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int candidateId;

    @Column(unique = true)
    private String imagePath;

    private String candidateName;
    private int candidateAge;
    private String partyName;
    private String partySymbol;
    private String candidateElectionName;
    private Long voteCount = 0L;

    @ManyToOne
    @JoinColumn(name = "election_id", nullable = false)
    private Election election;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true)
    private User user;

    @OneToMany(mappedBy = "candidate")
    private List<VoteRecord> votes;

    public Candidate() {}

    public Candidate(int candidateId, String imagePath, String candidateName, int candidateAge,
                     String partyName, String partySymbol, String candidateElectionName,
                     Long voteCount, Election election, User user, List<VoteRecord> votes) {
        this.candidateId = candidateId;
        this.imagePath = imagePath;
        this.candidateName = candidateName;
        this.candidateAge = candidateAge;
        this.partyName = partyName;
        this.partySymbol = partySymbol;
        this.candidateElectionName = candidateElectionName;
        this.voteCount = voteCount;
        this.election = election;
        this.user = user;
        this.votes = votes;
    }

    // Getters & Setters
    public int getCandidateId() { return candidateId; }
    public void setCandidateId(int candidateId) { this.candidateId = candidateId; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public String getCandidateName() { return candidateName; }
    public void setCandidateName(String candidateName) { this.candidateName = candidateName; }

    public int getCandidateAge() { return candidateAge; }
    public void setCandidateAge(int candidateAge) { this.candidateAge = candidateAge; }

    public String getPartyName() { return partyName; }
    public void setPartyName(String partyName) { this.partyName = partyName; }

    public String getPartySymbol() { return partySymbol; }
    public void setPartySymbol(String partySymbol) { this.partySymbol = partySymbol; }

    public String getCandidateElectionName() { return candidateElectionName; }
    public void setCandidateElectionName(String candidateElectionName) {
        this.candidateElectionName = candidateElectionName;
    }

    public Long getVoteCount() { return voteCount; }
    public void setVoteCount(Long voteCount) { this.voteCount = voteCount; }

    public Election getElection() { return election; }
    public void setElection(Election election) { this.election = election; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public List<VoteRecord> getVotes() { return votes; }
    public void setVotes(List<VoteRecord> votes) { this.votes = votes; }

    @Override
    public String toString() {
        return "Candidate [candidateId=" + candidateId +
                ", candidateName=" + candidateName +
                ", partyName=" + partyName +
                ", voteCount=" + voteCount +
                ", electionId=" + (election != null ? election.getElectionId() : null) +
                ", userId=" + (user != null ? user.getUserId() : null) +
                "]";
    }
}
