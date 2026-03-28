<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Already Voted Warning Page</title>

<!-- Auto redirect after 5 seconds -->
<meta http-equiv="refresh" content="5;URL=logoutWithoutVote"/>

</head>

<body style="
    margin:0;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background: linear-gradient(135deg, #fff1f2, #fef2f2);
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
">

<div style="
    background:white;
    padding:45px 55px;
    border-radius:22px;
    box-shadow:0 16px 40px rgba(0,0,0,0.15);
    text-align:center;
    max-width:540px;
">

<h1 style="
    margin-top:0;
    color:#dc2626;
    font-size:30px;
">
    ⚠️ Vote Not Submitted
</h1>

<h2 style="
    color:#7f1d1d;
    margin:18px 0;
">
    ${warning}
</h2>

<h3 style="
    color:#1f2937;
    margin:12px 0;
">
    ${msg}
</h3>

<h5 style="
    color:#6b7280;
    font-weight:500;
    margin-top:14px;
">
    ${note}
</h5>

<hr style="
    margin:28px 0;
    border:none;
    height:1px;
    background:#e5e7eb;
">

<p style="
    font-size:14px;
    color:#6b7280;
">
    You will be logged out automatically in a few seconds.
</p>

</div>
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
