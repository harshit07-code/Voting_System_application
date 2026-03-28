
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate CRUD form</title>
</head>

<body style="
    margin:0;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height:100vh;

    background-image:
    linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)),
    url('/candi.webp');
    

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;

    
   
">
<jsp:include page="commonHeader/header.jsp" />

<div style="
    display:flex;
    flex-direction:column;
    align-items:center;
    padding-top:40px;
">

<!-- ================= CANDIDATE TABLE ================= -->
<div style="
    max-width:1200px;
    margin:30px auto;
    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding:25px;
    border-radius:18px;
    box-shadow:0 12px 30px rgba(0,0,0,0.12);
">

<h3 style="margin-top:0; color:#1f2937;">Candidate List</h3>

<table style="
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
    font-size:14px;
">
<thead>
<tr style="background:#eef2ff;">
    <th style="padding:10px;">Candidate Id</th>
    <th style="padding:10px;">Age</th>
    <th style="padding:10px;">Election Name</th>
    <th style="padding:10px;">Candidate Name</th>
    <th style="padding:10px;">Party</th>
    <th style="padding:10px;">Votes</th>
    <th style="padding:10px;">Election Id</th>
    <th style="padding:10px;">User Id</th>
    <th style="padding:10px;">Actions</th>
</tr>
</thead>

<tbody>
<c:forEach var="c" items="${candidateList}">
<tr style="text-align:center; border-bottom:1px solid #e5e7eb;">
    <td style="padding:8px;">${c.candidateId}</td>
    <td style="padding:8px;">${c.candidateAge}</td>
    <td style="padding:8px;">${c.candidateElectionName}</td>
    <td style="padding:8px;">${c.candidateName}</td>
    <td style="padding:8px;">${c.partyName}</td>
    <td style="padding:8px;">${c.voteCount}</td>
    <td style="padding:8px;">${c.election.electionId}</td>
    <td style="padding:8px;">${c.user.userId}</td>
    <td style="padding:8px;">
        <form action="updateCandidateform" method="POST" style="display:inline;">
            <input type="hidden" name="candidateId" value="${c.candidateId}">
            <button type="submit" name="button" value="update"
                style="padding:6px 12px; border:none; border-radius:8px; background:#4f46e5; color:white;">
                Update
            </button>
        </form>

        <form action="removeCandidates" method="POST" style="display:inline;">
            <input type="hidden" name="candidateId" value="${c.candidateId}">
            <button type="submit" name="button" value="remove"
                style="padding:6px 12px; border:none; border-radius:8px; background:#ef4444; color:white;">
                Remove
            </button>
        </form>
    </td>
</tr>
</c:forEach>
</tbody>
</table>
</div>

<!-- ================= FORMS ================= -->
<c:choose>


<c:when test="${button=='register'}">
<div style="
    max-width:520px;
    margin:30px auto;
    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding:30px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.12);
">
<h3>Registration Form</h3>

<form action="registerCandidate" method="POST" enctype="multipart/form-data">

<input type="text" name="candidateName" placeholder="Candidate Name"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">

<input type="number" name="candidateAge" placeholder="Candidate Age"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">

<input type="text" name="partyName" placeholder="Party Name"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
Profile Photo
<input type="file" name="image" accept="image/*"
       style="width:100%; padding:8px; margin-bottom:12px; border-radius:10px; border:1px dashed #9ca3af;">

<select name="electionId"
        style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
<c:forEach var="e" items="${electionList}">
<option value="${e.electionId}">${e.electionName}</option>
</c:forEach>
</select>
Party Symbol
<input type="file" name="partyImage" accept="image/* "
       style="width:100%; padding:8px; margin-bottom:18px; border-radius:10px; border:1px dashed #9ca3af;">

<button type="submit"
    style="width:100%; padding:12px; background:#4f46e5; color:white; border:none; border-radius:12px; font-weight:600;">
Register
</button>

</form>
</div>
</c:when>


<c:when test="${button=='update'}">
<div style="
    max-width:520px;
    margin:30px auto;
    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding:30px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.12);
">

<h3>Update Form</h3>

<form action="updateCandidates" method="POST">

<input type="hidden" name="candidateId" value="${candidate.candidateId}">
<input type="hidden" name="userId" value="${candidate.user.userId}">
<input type="hidden" name="electionId" value="${candidate.election.electionId}">

<input type="text" name="candidateName" value="${candidate.candidateName}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">

<input type="number" name="candidateAge" value="${candidate.candidateAge}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">

<input type="text" name="partyName" value="${candidate.partyName}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">

<input type="text" name="candidateElectionName" value="${candidate.candidateElectionName}"
       style="width:100%; padding:10px; margin-bottom:18px; border-radius:10px; border:1px solid #d1d5db;">

<button type="submit"
    style="width:100%; padding:12px; background:#4f46e5; color:white; border:none; border-radius:12px; font-weight:600;">
Update
</button>

</form>
</div>
</c:when>

</c:choose>

<!-- ================= MESSAGE ================= -->
<c:if test="${not empty msg}">
<center>
<h3 style="color:#059669;">${msg}</h3>
</center>
</c:if>

<!-- ================= MENU ================= -->
<center style="margin-bottom:40px;">
<form action="backToAdminPage" method="GET">
<button type="submit"
    style="padding:12px 26px; border:none; border-radius:12px; background:#4f46e5; color:white; font-weight:600;">
Menu
</button>
</form>
</center>
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
