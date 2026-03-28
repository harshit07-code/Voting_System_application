<jsp:include page="commonHeader/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Election Table </title>
</head>
<body>

<h3>ELection Table</h3>

<table>
 <thead>
 <tr> 
 <th>Election_id </th>
 <th> Election_Name </th>
 <th>start_date </th>
 <th>end_date</th>
 <th>status</th>
 </tr>
  </thead>
 <tbody>
 <c:forEach var="e" items="${electionList }">
 <tr>
 <td> ${e.electionId } </td>
 <td> ${e.electionName } </td>
 <td> ${e.endDate } </td>
 <td> ${e.startDate } </td>
 <td> ${e.status } </td>
</tr>
 </c:forEach>
 </tbody>
</table>
</div>
<jsp:include page="commonFooter/footer.jsp" />

 </body>
</html>