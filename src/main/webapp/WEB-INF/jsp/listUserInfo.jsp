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
	<div style="width:500px;margin:20px auto;text-align: center">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>uid</td>
				<td>userName</td>
				<td>password</td>
				<td>编辑</td>
				<td>删除</td>
			</tr>
			<c:forEach items="${page.list}" var="u" varStatus="st">
				<tr>
					<td>${u.uid }</td>
					<td>${u.userName }</td>
					<td>${u.password }</td>
					<td><a href="editUserInfo?uid=${u.uid }">编辑</a></td>
					<td><a href="deleteUserInfo?uid=${u.uid }">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<div>
			<a href="?start=1">首页</a>
			<a href="?start=${page.pageNum-1 }">[上一页]</a>
			<a href="?start=${page.pageNum+1 }">[下一页]</a>
			<a href="?start=${page.pages }">[末    页]</a>
		</div>
		<br>
		<form action="addUserInfo" method="post">
			name:<input name="userName"><br>
			password:<input name="password"><br>
			<button type="submit">提交</button>
		</form>
		<a href="preLogin">登录</a>
		<a href="preRegister">注册</a>
	</div>
</body>
</html>