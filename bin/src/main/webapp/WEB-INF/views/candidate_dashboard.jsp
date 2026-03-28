
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Dashboard</title>
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

<center style="margin-top:30px;">

<!-- ================= MAIN CARD ================= -->
<div style="
    max-width:1000px;
    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding:35px;
    border-radius:22px;
    box-shadow:0 12px 30px rgba(0,0,0,0.12);
">

<h3 style="margin-top:0; color:#1f2937;">
    Welcome to Candidate Dashboard
</h3>

<h4 style="color:#4b5563; margin-bottom:25px;">
    Select an election to see the candidates
</h4>

<!-- ================= SELECT ELECTION ================= -->
<form action="showElectionCandidates" method="GET">

<label style="font-weight:600;">Select Election:</label><br><br>

<select name="electionId" required
    onchange="this.form.submit()"
    style="
        padding:10px 16px;
        border-radius:12px;
        border:1px solid #d1d5db;
        font-size:15px;
        min-width:260px;
    ">
 <option value="">--Select Election-- </option>
 
 <c:forEach var="e" items="${electionList}"> 
  <option value="${e.electionId}">${e.electionName}</option>
 </c:forEach>
</select>
</form>

<hr style="
    margin:30px 0;
    border:none;
    height:1px;
    background:#e5e7eb;
">

<!-- ================= CANDIDATE CARDS ================= -->
<div style="
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
    gap:25px;
    
">

<c:forEach var="candidates" items="${candidates}">

<div style="
    width:300px;
    border:1px solid #e5e7eb;
    padding:22px;
    border-radius:18px;
    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    box-shadow:0 6px 18px rgba(0,0,0,0.08);
">
<span style="
    position:absolute;
    top:12px;
    right:12px;
    width:26px;
    height:26px;
    background:#22c55e;
    color:white;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:16px;
    font-weight:bold;
    box-shadow:0 4px 10px rgba(0,0,0,0.15);
">
    ✓
</span>

<!-- Party Symbol -->
<img src="${pageContext.request.contextPath}/partySymbol/${candidates.partySymbol}"
     alt="Party Symbol"
     style="
        width:80px;
        height:80px;
        border-radius:50%;
        object-fit:cover;
        border:2px solid #ddd;
        margin-bottom:10px;
     " />

<!-- Candidate Name -->
<h3 style="margin:10px 0; color:#1f2937;">
    ${candidates.candidateName}
</h3>

<!-- Candidate Image -->
<img src="${pageContext.request.contextPath}/user-images/${candidates.imagePath}"
     alt="candidate image"
     style="
        width:80px;
        height:80px;
        border-radius:50%;
        object-fit:cover;
        border:2px solid #ddd;
        margin-bottom:10px;
     " />

<p><strong>ID:</strong> ${candidates.candidateId}</p>
<p><strong>Age:</strong> ${candidates.candidateAge}</p>
<p><strong>Election Name:</strong> ${candidates.candidateElectionName}</p>
<p><strong>Party Name:</strong> ${candidates.partyName}</p>

<!--<p style="
    font-size:17px;
    font-weight:700;
    color:#10b981;
    margin-top:10px;
">
    Votes: ${candidates.voteCount}
</p>-->

</div>

</c:forEach>
</div>

</div>
</center>

<!-- ================= LOGOUT ================= -->
<!--  <div style="text-align:center; margin:40px 0;">
<form action="loginPage" method="GET">
<button type="submit"
    style="
        padding:12px 26px;
        border:none;
        border-radius:12px;
        background:#4f46e5;
        color:white;
        font-size:15px;
        font-weight:600;
        box-shadow:0 6px 16px rgba(79,70,229,0.35);
        cursor:pointer;
    ">
Log Out
</button>
</form>
</div>-->
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
