
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voter CRUD forms</title>
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

<!-- ================= TABLE ================= -->
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

<h3 style="margin-top:0; color:#1f2937;">Voter List</h3>

<table style="
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
    font-size:14px;
">
<thead>
 <tr style="background:#eef2ff;">
 <th style="padding:10px;">Voter Id</th>
 <th style="padding:10px;">Address</th>
 <th style="padding:10px;">DOB</th>
 <th style="padding:10px;">Email</th>
 <th style="padding:10px;">Name</th>
 <th style="padding:10px;">Password</th>
 <th style="padding:10px;">Phone</th>
 <th style="padding:10px;">Aadhar</th>
 <th style="padding:10px;">Actions</th>
 </tr>
</thead>

<tbody>
<c:forEach var="v" items="${voterList}">
<tr style="text-align:center; border-bottom:1px solid #e5e7eb;">
   <td style="padding:8px;">${v.voterId}</td>
   <td style="padding:8px;">${v.address}</td>
   <td style="padding:8px;">${v.dob}</td>
   <td style="padding:8px;">${v.email}</td>
   <td style="padding:8px;">${v.name}</td>
   <td style="padding:8px;">${v.password}</td>
   <td style="padding:8px;">${v.phoneNO}</td>
   <td style="padding:8px;">${v.aadharNo}</td>
   <td style="padding:8px;">
        <form action="updateVoterform" method="POST" style="display:inline;">
            <input type="hidden" name="voterId" value="${v.voterId}">
            <button type="submit" name="button" value="update"
                style="padding:6px 12px; border:none; border-radius:8px; background:#4f46e5; color:white;">
                Update
            </button>
        </form>

        <form action="removeVoter" method="POST" style="display:inline;">
            <input type="hidden" name="voterId" value="${v.voterId}">
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

<h3 style="margin-top:0;">Registration Form</h3>

<form action="registerVoter" method="POST" enctype="multipart/form-data">

<label>Aadhar Number</label>
<input type="text" name="aadharNo"  required style="width:100%; padding:10px; margin:6px 0 14px; border-radius:10px; border:1px solid #d1d5db;">

<label>Voter Address</label>
<input type="text" name="address"  required  style="width:100%; padding:10px; margin:6px 0 14px; border-radius:10px; border:1px solid #d1d5db;">

<label>Voter DOB</label>
<input type="date" name="dob" required  style="width:100%; padding:10px; margin:6px 0 14px; border-radius:10px; border:1px solid #d1d5db;">

<label>Voter Email</label>
<input type="text" name="email" required  style="width:100%; padding:10px; margin:6px 0 14px; border-radius:10px; border:1px solid #d1d5db;">

<label>Voter Name</label>
<input type="text" name="name" required  style="width:100%; padding:10px; margin:6px 0 14px; border-radius:10px; border:1px solid #d1d5db;">

<label>Voter Password</label>
<input type="text" name="password"  required  style="width:100%; padding:10px; margin:6px 0 14px; border-radius:10px; border:1px solid #d1d5db;">

<label>Voter Phone Number</label>
<input type="text" name="phoneNO"  required  style="width:100%; padding:10px; margin:6px 0 14px; border-radius:10px; border:1px solid #d1d5db;">

<label>Voter Image</label>
<input type="file" name="image" required  accept="image/*"
       style="width:100%; padding:8px; margin:6px 0 18px; border-radius:10px; border:1px dashed #9ca3af;">

<button type="submit"
    style="width:100%; padding:12px; background:#4f46e5; color:white; border:none; border-radius:12px; font-weight:600;">
Register
</button>

</form>

<c:if test="${not empty msg}">
<h3 style="color:#059669; text-align:center;">${msg}</h3>
</c:if>
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

<h3>Updation Form</h3>
<h5>Enter new details:</h5>

<form action="updateVoter" method="POST">


<input type="hidden" name="voterId" value="${voter.voterId}">
       
Aadhar No.
<input type="text" name="aadharNo" value="${voter.aadharNo}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
Address
<input type="text" name="address" value="${voter.address}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
Date Of Birth
<input type="date" name="dob" value="${voter.dob}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
Email
<input type="text" name="email" value="${voter.email}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
Name
<input type="text" name="name" value="${voter.name}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
Password
<input type="text" name="password" value="${voter.password}"
       style="width:100%; padding:10px; margin-bottom:12px; border-radius:10px; border:1px solid #d1d5db;">
PhoneNO
<input type="text" name="phoneNO" value="${voter.phoneNO}"
       style="width:100%; padding:10px; margin-bottom:18px; border-radius:10px; border:1px solid #d1d5db;">

<button type="submit"
    style="width:100%; padding:12px; background:#4f46e5; color:white; border:none; border-radius:12px; font-weight:600;">
Update
</button>

</form>

<c:if test="${not empty msg}">
<h3 style="color:#059669; text-align:center;">${msg}</h3>
</c:if>
</div>
</c:when>


<c:when test="${button=='remove'}">
<div style="
    max-width:420px;
    margin:30px auto;
   background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding:30px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.12);
">

<h3>Delete Form</h3>

<form action="removeVoter" method="POST">
<input type="text" name="voterId" placeholder="Enter Voter Id"
       style="width:100%; padding:10px; margin-bottom:18px; border-radius:10px; border:1px solid #d1d5db;">

<button type="submit"
    style="width:100%; padding:12px; background:#ef4444; color:white; border:none; border-radius:12px; font-weight:600;">
Delete
</button>
</form>

<c:if test="${not empty msg}">
<h3 style="color:#dc2626; text-align:center;">${msg}</h3>
</c:if>
</div>

</c:when>

</c:choose>
</div>
<!-- ================= MENU ================= -->
<center style="margin-bottom:40px;">
<form method="GET">
<button type="submit" formaction="AdminDashboard"
    style="padding:12px 26px; border:none; border-radius:12px; background:#4f46e5; color:white; font-weight:600;">
Menu
</button>
</form>
</center>
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
