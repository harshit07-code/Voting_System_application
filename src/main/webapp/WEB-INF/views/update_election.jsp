
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Elections Form</title>
</head>
<body style="
    margin:0;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height:100vh;

    background-image:
    linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)),
    url('/eci.jpg');
    

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


<!-- ================= VIEW TABLE BUTTON ================= -->
<div style="max-width:900px; margin:30px auto 20px; text-align:right;">
    <form action="ShowElectionTable" method="GET">
        <input type="hidden" name="page" value="update_election">
        <button type="submit" name="showtable" value="true"
            style="
                padding:10px 18px;
                border:none;
                border-radius:10px;
                background:#4f46e5;
                color:white;
                font-weight:600;
                cursor:pointer;
            ">
            See Election table
        </button>
    </form>
</div>

<!-- ================= TABLE ================= -->
<c:if test="${showtable}">
<div style="
    max-width:900px;
    margin:0 auto 40px;
    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding:25px;
    border-radius:16px;
    box-shadow:0 10px 30px rgba(0,0,0,0.12);
">
    <h3 style="margin-top:0; color:#1f2937;">Election Table</h3>

    <table style="
        width:100%;
        border-collapse:collapse;
        margin-top:15px;
        font-size:14px;
    ">
        <thead>
            <tr style="background:#eef2ff;">
                <th style="padding:10px; border-bottom:1px solid #e5e7eb;">Election ID</th>
                <th style="padding:10px; border-bottom:1px solid #e5e7eb;">Election Name</th>
                <th style="padding:10px; border-bottom:1px solid #e5e7eb;">End Date</th>
                <th style="padding:10px; border-bottom:1px solid #e5e7eb;">Start Date</th>
                <th style="padding:10px; border-bottom:1px solid #e5e7eb;">Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="e" items="${electionList}">
                <tr style="text-align:center;">
                    <td style="padding:8px; border-bottom:1px solid #f1f5f9;">${e.electionId}</td>
                    <td style="padding:8px; border-bottom:1px solid #f1f5f9;">${e.electionName}</td>
                    <td style="padding:8px; border-bottom:1px solid #f1f5f9;">${e.endDate}</td>
                    <td style="padding:8px; border-bottom:1px solid #f1f5f9;">${e.startDate}</td>
                    <td style="padding:8px; border-bottom:1px solid #f1f5f9;">${e.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</c:if>

<!-- ================= UPDATE FORM ================= -->
<div style="
    max-width:520px;
    margin:0 auto 30px;
    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding:30px;
    border-radius:18px;
    box-shadow:0 10px 30px rgba(0,0,0,0.12);
">
    <form action="updateElection" method="POST">

        <h3 style="margin-top:0; color:#1f2937;">Update form</h3>

        <label>Select which election you want to update:</label>
        <select name="electionId" required
            style="width:100%; padding:10px; margin:8px 0 18px; border-radius:8px; border:1px solid #d1d5db;">
            <option value="">--Select Election--</option>
            <c:forEach var="e" items="${electionList}">
                <option value="${e.electionId}">${e.electionName}</option>
            </c:forEach>
        </select>

        <h4 style="margin-bottom:10px;">Enter new details below:</h4>

        <label>Election Name</label>
        <input type="text" name="electionName" required
            style="width:100%; padding:10px; margin:8px 0 15px; border-radius:8px; border:1px solid #d1d5db;">

        <label>Start Date</label>
        <input type="date" name="startDate" required
            style="width:100%; padding:10px; margin:8px 0 15px; border-radius:8px; border:1px solid #d1d5db;">

        <label>End Date</label>
        <input type="date" name="endDate" required
            style="width:100%; padding:10px; margin:8px 0 15px; border-radius:8px; border:1px solid #d1d5db;">

        <label>Status</label>
        <select name="status" required
            style="width:100%; padding:10px; margin:8px 0 20px; border-radius:8px; border:1px solid #d1d5db;">
            <option value="">--select Status--</option>
            <option value="Ongoing">Ongoing</option>
            <option value="Upcoming">Upcoming</option>
            <option value="Completed">Completed</option>
        </select>

        <button type="submit"
            style="
                width:100%;
                padding:12px;
                border:none;
                border-radius:12px;
                background:#4f46e5;
                color:white;
                font-weight:700;
                cursor:pointer;
            ">
            submit
        </button>
    </form>
</div>
</div>
<!-- ================= MESSAGE ================= -->
<c:if test="${not empty msg}">
<center>
    <h3 style="color:#059669;">${msg}</h3>
</center>
</c:if>

<!-- ================= MENU ================= -->
<center style="margin-bottom:30px;">
    <form action="backToAdminDashboard" method="GET">
        <button type="submit"
            style="
                padding:10px 24px;
                border:none;
                border-radius:12px;
                background:#4f46e5;
                color:white;
                font-weight:600;
                cursor:pointer;
            ">
            Menu
        </button>
    </form>
</center>
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
