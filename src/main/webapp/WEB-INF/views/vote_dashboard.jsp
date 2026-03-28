
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Dashboard</title>
</head>

<body style="
    margin:0;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height:100vh;

    background-image:
    linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)),
    url('/eciv.jpg');
    

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;

   
">
<jsp:include page="commonHeader/header.jsp" />
<div display:flex;
    justify-content:center;
    align-items:flex-start;
    padding-top:40px;
    ">
<center style="margin-top:40px;">

<div style="
    max-width:850px;
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.12);
">

<!-- ================= ELECTION NAME ================= -->
<button style="
    padding:10px 26px;
    border:none;
    border-radius:14px;
    background:#4f46e5;
    color:white;
    font-size:16px;
    font-weight:700;
    margin-bottom:20px;
">
${electionName}
</button>

<h3 style="color:#1f2937;">Vote to your Candidate</h3>
<h4 style="color:#4f46e5;">
    You can only vote to a single candidate
</h4>
<h6 style="color:#6b7280; margin-bottom:30px;">
    Once you click Vote button you automatically logout and then cannot vote again for the same Election
</h6>

<!-- ================= NO CANDIDATES ================= -->
<c:if test="${empty Candidates}">
    <p style="color:#6b7280;">No candidate register yet</p><br>
    <button style="
        padding:10px 24px;
        border:none;
        border-radius:12px;
        background:#4f46e5;
        color:white;
        font-weight:600;
    ">
        Logout
    </button>
</c:if>

<!-- ================= CANDIDATE LIST ================= -->
<c:forEach var="c" items="${Candidates}">

<div style="
    border:1px solid #e5e7eb;
    padding:20px;
    margin:20px auto;
    border-radius:18px;
    width:340px;
    background:#f8fafc;
">

<!-- Candidate Photo -->
<img 
    src="${pageContext.request.contextPath}/user-images/${c.imagePath}"
    alt="Candidate photo"
    style="
        width:90px;
        height:90px;
        border-radius:50%;
        object-fit:cover;
        border:3px solid #e5e7eb;
        margin-bottom:10px;
    "
>

<h3 style="margin:10px 0; color:#1f2937;">
    ${c.candidateName}
</h3>

<p><strong>ID:</strong> ${c.candidateId}</p>
<p><strong>Age:</strong> ${c.candidateAge}</p>
<p><strong>Election Name:</strong> ${c.candidateElectionName}</p>

<p>
<strong>Party:</strong> ${c.partyName}
<br><br>
<img 
    src="${pageContext.request.contextPath}/partySymbol/${c.partySymbol}"
    alt="Party symbol"
    style="
        width:70px;
        height:70px;
        border-radius:50%;
        object-fit:cover;
        border:2px solid #ddd;
    "
>
</p>

<form action="thanksPage" method="POST" style="margin-top:15px;">
    <input type="hidden" name="candidateId" value="${c.candidateId}">
    <input type="hidden" name="electionId" value="${c.election.electionId}">

    <button type="submit"
        style="
            width:100%;
            padding:12px;
            border:none;
            border-radius:14px;
            background:#10b981;
            color:white;
            font-size:16px;
            font-weight:700;
            cursor:pointer;
        ">
        Vote
    </button>
</form>

</div>

</c:forEach>
</div>
</div>
</center>
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
