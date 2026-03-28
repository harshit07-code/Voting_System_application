<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanks page</title>

<!-- Auto redirect after 5 seconds -->
<meta http-equiv="refresh" content="5;URL=logout"/>

</head>

<body style="
    margin:0;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
">

<div style="
    background:white;
    padding:40px 50px;
    border-radius:22px;
    box-shadow:0 15px 35px rgba(0,0,0,0.12);
    text-align:center;
    max-width:520px;
">

<h2 style="
    margin-top:0;
    color:#10b981;
    font-size:28px;
">
    ✅ Thanks for your vote!
</h2>

<h3 style="
    color:#1f2937;
    margin:15px 0;
">
    ${msg}
</h3>

<h5 style="
    color:#6b7280;
    font-weight:500;
    margin-top:10px;
">
    ${note}
</h5>

<hr style="
    margin:25px 0;
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
