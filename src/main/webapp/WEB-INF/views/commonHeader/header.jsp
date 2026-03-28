<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty sessionScope.Loggedin}">
    <div style="
        position:sticky;
        top:0;
        z-index:1000;
        display:flex;
        align-items:center;
        padding:14px 30px;
        background: rgba(255,255,255,0.55);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
        border-bottom:1px solid #e5e7eb;
        font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        box-shadow:0 4px 12px rgba(0,0,0,0.06);
    ">

        <img src="${pageContext.request.contextPath}/${sessionScope.Loggedin.dp}"
             width="42" height="42"
             style="border-radius:50%; margin-right:12px;" />

        <span style="font-weight:600; color:#1f2937;">
            ${sessionScope.Loggedin.username}
        </span>

        <a href="${pageContext.request.contextPath}/logoutWithoutVote"
           style="
               margin-left:auto;
               padding:8px 18px;
               background:#4f46e5;
               color:white;
               border-radius:10px;
               text-decoration:none;
               font-weight:600;
           ">
            Logout
        </a>
    </div>
</c:if>
