
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voter Dashboard</title>
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
    max-width:700px;
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.12);
">

<h1 style="margin-top:0; color:#1f2937;">
    Welcome to Voter Dashboard
</h1>

<h3 style="color:#4f46e5; margin-top:30px;">
    Ongoing Elections :
</h3>

<!-- ================= NO ELECTIONS ================= -->
<c:if test="${empty ongoingElections}">
    <p style="color:#6b7280; font-size:16px;">
        No ongoing elections at the moment
    </p>
</c:if>

<!-- ================= ELECTION LIST ================= -->
<form action="showCandidates" method="POST">
<ul style="list-style:none; padding:0; margin-top:25px;">

<c:forEach var="election" items="${ongoingElections}">
    <li style="margin-bottom:18px;">
        <button type="submit"
            name="electionName"
            value="${election.electionName}"
            style="
                width:100%;
                padding:14px;
                border:none;
                border-radius:14px;
                background:#4f46e5;
                color:white;
                font-size:16px;
                font-weight:600;
                cursor:pointer;
                box-shadow:0 6px 15px rgba(79,70,229,0.35);
            ">
            ${election.electionName}
        </button>
    </li>
</c:forEach>

</ul>
</form>
</div>
</div>
</center>


<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
