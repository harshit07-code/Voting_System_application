<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Online Voting System</title>
</head>

<body style="
    margin:0;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #e0f2fe, #ede9fe);
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:flex-start;
    padding-top:50px;
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
    <source src="${pageContext.request.contextPath}/backl.mp4" type="video/mp4">
</video>
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

    <!-- Header -->
    <div style="text-align:center; margin-bottom:35px;">
        <h1 style="
            margin:0;
            color:#1f2937;
            font-size:28px;
        ">
            Login
        </h1>
        <p style="
            margin-top:8px;
            color:#4b5563;
            font-size:15px;
        ">
            Access your voting account securely
        </p>
    </div>

    <!-- Login Form -->
    <form action="checkuser" method="POST">

        <!-- User Type -->
        <div style="margin-bottom:20px;">
            <label style="
                display:block;
                margin-bottom:6px;
                font-size:14px;
                color:#374151;
                font-weight:600;
            ">
                Login As
            </label>
            <select name="role" required
                style="
                    width:100%;
                    padding:12px;
                    border-radius:10px;
                    border:1px solid #d1d5db;
                    font-size:14px;
                    outline:none;
                ">
                <option value="">Select Role</option>
                <option value="voter">Voter</option>
                <option value="candidate">Candidate</option>
                <option value="admin">Admin</option>
            </select>
        </div>

        <!-- User ID -->
        <div style="margin-bottom:20px;">
            <label style="
                display:block;
                margin-bottom:6px;
                font-size:14px;
                color:#374151;
                font-weight:600;
            ">
                User ID
            </label>
            <input type="text" name="username" required
                placeholder="Enter your ID"
                style="
                    width:100%;
                    padding:12px;
                    border-radius:10px;
                    border:1px solid #d1d5db;
                    font-size:14px;
                    outline:none;
                ">
        </div>

        <!-- Password -->
        <div style="margin-bottom:30px;">
            <label style="
                display:block;
                margin-bottom:6px;
                font-size:14px;
                color:#374151;
                font-weight:600;
            ">
                Password
            </label>
            <input type="password" name="password" required
                placeholder="Enter your password"
                style="
                    width:100%;
                    padding:12px;
                    border-radius:10px;
                    border:1px solid #d1d5db;
                    font-size:14px;
                    outline:none;
                ">
        </div>

        <!-- Login Button -->
        <div style="text-align:center;">
            <button type="submit"
                style="
                    width:100%;
                    padding:14px;
                    background:#4f46e5;
                    color:#ffffff;
                    border:none;
                    border-radius:12px;
                    font-size:16px;
                    font-weight:600;
                    cursor:pointer;
                    box-shadow:0 6px 15px rgba(79,70,229,0.4);
                ">
                Login
            </button>
        </div>

    </form>

    <!-- Footer -->
    <div style="
        text-align:center;
        margin-top:25px;
        font-size:13px;
        color:#6b7280;
    ">
        © 2025 Online Voting System
    </div>

</div>
<jsp:include page="commonFooter/footer.jsp" />

</body>
</html>
