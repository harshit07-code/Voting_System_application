<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Voting Portal</title>
</head>

<body style="
    margin:0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #e0f2fe, #ede9fe);
    min-height:100vh;
    
    
    display:flex;
    justify-content:center;
    align-items:flex-start;
    padding-top:40px;
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
    <source src="${pageContext.request.contextPath}/backv.mp4" type="video/mp4">
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
        <h1 style="margin:0; color:#1f2937; font-size:30px;">
            Online Voting System
        </h1>
        <p style="
            margin-top:10px;
            color:#4b5563;
            font-size:16px;
        ">
            Transparent • Secure • Easy to Use
        </p>
    </div>

    <!-- Rules Section -->
    <div style="
        display:flex;
        justify-content:space-between;
        gap:30px;
        flex-wrap:wrap;
        margin-bottom:40px;
    ">

        <!-- Voter Rules -->
        <div style="
    flex:1;
    min-width:300px;

    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);

    padding:25px 28px;
    border-radius:14px;
    border:1px solid rgba(255,255,255,0.4);
">
        
            <h3 style="
                margin-top:0;
                color:#4f46e5;
                font-size:20px;
            ">
                🗳️ Voter Rules
            </h3>
            <p style="
                font-size:15px;
                color:#374151;
                line-height:1.8;
                margin-bottom:0;
            ">
                ✔ Only registered voters are allowed to vote.<br>
                ✔ Each voter can cast only one vote per election.<br>
                ✔ Voter identity will be verified before voting.<br>
                ✔ Once a vote is submitted, it cannot be changed.<br>
                ✔ Any misuse will result in disqualification.
            </p>
        </div>

        <!-- Candidate Rules -->
       <div style="
    flex:1;
    min-width:300px;

    background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);

    padding:25px 28px;
    border-radius:14px;
    border:1px solid rgba(255,255,255,0.4);
">
       
            <h3 style="
                margin-top:0;
                color:#4f46e5;
                font-size:20px;
            ">
                🧑‍💼 Candidate Rules
            </h3>
            <p style="
                font-size:15px;
                color:#374151;
                line-height:1.8;
                margin-bottom:0;
            ">
                ✔ Candidates can only view elections they are registered for.<br><br>
                ✔ Candidates cannot vote using candidate credentials. To vote, log in as a voter with a valid Voter ID.
            </p>
        </div>

    </div>

    <!-- Buttons -->
    <div style="
        text-align:center;
        margin-top:20px;
    ">

        <form action="login" method="GET" style="display:inline-block; margin-right:15px;">
            <input type="submit" value="Login"
                style="
                    padding:14px 34px;
                    background:#4f46e5;
                    color:#ffffff;
                    border:none;
                    border-radius:10px;
                    font-size:16px;
                    font-weight:600;
                    cursor:pointer;
                    box-shadow:0 6px 15px rgba(79,70,229,0.4);
                ">
        </form>

        <form action="viewResults" method="GET" style="display:inline-block;">
            <button type="submit"
                style="
                    padding:14px 34px;
                    background:#059669;
                    color:#ffffff;
                    border:none;
                    border-radius:10px;
                    font-size:16px;
                    font-weight:600;
                    cursor:pointer;
                    box-shadow:0 6px 15px rgba(5,150,105,0.4);
                ">
                View Results
            </button>
        </form>

    </div>

</div>

<jsp:include page="commonFooter/footer.jsp" />
</body>
</html>
