<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有用户</title>
</head>
<body>
	<table align="center" border="1" cellspacing="0">
		<tr>
			<td>uid</td>
			<td>userName</td>
		</tr>
		<c:forEach items="${us}" var="u" varStatus="st">
			<tr>
				<td>${u.uid }</td>
				<td>${u.userName }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>