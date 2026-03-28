
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>

<body style="
    margin:0;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height:100vh;

    background-image:
    linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)),
    url('/eci2.jpg');
    

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

<center>
    <h2 style="
        margin-top:30px;
        color:#1f2937;
        font-weight:700;
    ">
        ${msg}
    </h2>
    <p style="color:#6b7280; margin-bottom:40px;">
        Admin Control Panel
    </p>
</center>

<!-- ================= DASHBOARD WRAPPER ================= -->
<div style="
    display:flex;
    justify-content:center;
    gap:40px;
    flex-wrap:wrap;
    margin-top:40px;
    padding-bottom:80px;
    width:100%;
">


<!-- ================= ELECTION ================= -->
<div style="
    width:350px;
    min-height:380px;
    background:rgba(255,255,255,0.75);
    backdrop-filter:blur(10px);
    border-radius:20px;
    padding:25px;
    box-shadow:0 20px 40px rgba(0,0,0,0.12);
    text-align:center;
">
    <h3 style="color:#4f46e5; margin-bottom:38px; font-size: 25;">Manage Elections</h3>

    <a href="showCreateform">
        <button style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750;font-size: 18;">
            Create Election
        </button>
    </a><br><br>

    <a href="showAllElectionsOnUpdateform">
        <button style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750; font-size: 18;">
            Update Election
        </button>
    </a><br><br>

    <a href="showAllElectionsOnRemoveform">
        <button style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750;font-size: 18;">
            Remove Election
        </button>
    </a>
</div>

<!-- ================= CANDIDATE ================= -->
<div style="
    width:350px;
    min-height:380px;
    background:rgba(255,255,255,0.75);
    backdrop-filter:blur(10px);
    border-radius:20px;
    padding:25px;
    box-shadow:0 20px 40px rgba(0,0,0,0.12);
    text-align:center;
">
    <h3 style="color:#4f46e5; margin-bottom:38px;font-size: 25;">Manage Candidates</h3>

    <form action="candidateForms" method="POST">
        <button type="submit" name="button" value="register"
            style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750;font-size: 18;">
            Register Candidates
        </button><br><br>

        <button type="submit" name="button" value=" "
            style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750; font-size: 18;">
            Update candidates
        </button><br><br>

        <button type="submit" name="button" value="   "
            style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750;font-size: 18;">
            Remove candidates
        </button>
    </form>
</div>

<!-- ================= VOTER ================= -->
<div style="
    width:350px;
    min-height:380px;
    background:rgba(255,255,255,0.75);
    backdrop-filter:blur(10px);
    border-radius:20px;
    padding:25px;
    box-shadow:0 20px 40px rgba(0,0,0,0.12);
    text-align:center;
">
    <h3 style="color:#4f46e5; margin-bottom:38px;font-size: 25;">Manage Voters</h3>

    <form action="showVoterForm" method="POST">
        <button type="submit" name="button" value="register"
            style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750;font-size: 18;">
            Register a voter
        </button><br><br>

        <button type="submit" name="button" value="update"
            style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750;font-size: 18;">
            Update a Voter
        </button><br><br>

        <button type="submit" name="button" value="remove"
            style="width:100%; padding:20px; border-radius:10px; border:none; font-weight:750;font-size: 18;">
            Remove a voter
        </button>
    </form>
</div>
</div>
</div>

<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
