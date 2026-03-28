<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result Page</title>
</head>

<body style="
    margin:0;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    min-height:100vh;
">
<video autoplay muted loop playsinline
    style="
        position:fixed;
        top:0;
        left:0;
        width:100%;
        height:100%;
        object-fit:cover;
        z-index:-2;
    ">
    <source src="${pageContext.request.contextPath}/backr.mp4" type="video/mp4">
</video>
<center style="margin-top:40px;">
<div style="
    width:95%;
    max-width:1000px;

    /* GLASS EFFECT */
    background: rgba(255,255,255,0.82);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);

    border-radius:20px;
    padding:40px 50px 45px;

    box-shadow:
        0 20px 50px rgba(0,0,0,0.35),
        inset 0 0 0 1px rgba(255,255,255,0.3);
">


<h2 style="margin-top:0; color:#1f2937;">
    🗳️ Election Results
</h2>

<p style="color:#6b7280; margin-bottom:25px;">
    Select an election to view candidate-wise results
</p>

<!-- ================= SELECT ELECTION ================= -->
<form action="showCandidatesForResults" method="GET">

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
    <option value="">--Select Election--</option>

    <c:forEach var="e" items="${electionList}">
        <option value="${e.electionId}">
            ${e.electionName}
        </option>
    </c:forEach>
</select>

</form>

<!-- ================= MESSAGE ================= -->
<c:if test="${not empty msg}">
    <h3 style="color:#dc2626; margin-top:25px;">
        ${msg}
    </h3>
</c:if>

<!-- ================= WINNER LINE ================= -->
<c:if test="${not empty candidates}">
    <c:set var="winner" value="${candidates[0]}" />

    <c:choose>
        <c:when test="${fn:length(candidates) > 1}">
            <c:set var="runnerUp" value="${candidates[1]}" />

            <div style="
                margin:25px auto;
                padding:18px 24px;
                max-width:700px;
                background:#ecfdf5;
                border-left:6px solid #10b981;
                border-radius:12px;
                font-size:18px;
                font-weight:600;
                color:#065f46;
            ">
                🏆 <strong>${winner.candidateName}</strong>
                won by
                <strong>${winner.voteCount - runnerUp.voteCount}</strong>
                votes
            </div>
        </c:when>

        <c:otherwise>
            <div style="
                margin:25px auto;
                padding:18px 24px;
                max-width:700px;
                background:#eff6ff;
                border-left:6px solid #2563eb;
                border-radius:12px;
                font-size:18px;
                font-weight:600;
                color:#1e3a8a;
            ">
                🏆 <strong>${winner.candidateName}</strong>
                won unopposed
            </div>
        </c:otherwise>
    </c:choose>
</c:if>

<hr style="
    margin:30px 0;
    border:none;
    height:1px;
    background:#e5e7eb;
">

<!-- ================= RESULT CARDS ================= -->
<c:if test="${not empty candidates}">
<c:forEach var="candidates" items="${candidates}">

<div style="
    border:1px solid #e5e7eb;
    padding:22px;
    margin:20px auto;
    border-radius:18px;
    width:340px;
    background:#f8fafc;
">

<img 
    src="${pageContext.request.contextPath}/user-images/${candidates.imagePath}"
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

<h3 style="margin-top:0; color:#1f2937;">
    ${candidates.candidateName}
</h3>

<p><strong>ID:</strong> ${candidates.candidateId}</p>
<p><strong>Age:</strong> ${candidates.candidateAge}</p>
<p><strong>Election Name:</strong> ${candidates.candidateElectionName}</p>
<p><strong>Party Name:</strong> ${candidates.partyName}</p>

<img 
    src="${pageContext.request.contextPath}/partySymbol/${candidates.partySymbol}"
    alt="Party Symbol"
    style="
        width:80px;
        height:80px;
        border-radius:50%;
        object-fit:cover;
        border:2px solid #ddd;
        margin-bottom:10px;
    "
>

<p style="
    margin-top:12px;
    font-size:18px;
    font-weight:700;
    color:#10b981;
">
    Votes: ${candidates.voteCount}
</p>

</div>

</c:forEach>
</c:if>

</div>
</center>
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
