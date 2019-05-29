<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>
  
<div style="margin:0px auto; width:500px">
  
<form action="updateUserInfo" method="post">
  
name: <input name="userName" value="${u.userName}"> <br>
  
<input name="uid" type="hidden" value="${u.uid}">
<button type="submit">提交</button>
  
</form>
</div>