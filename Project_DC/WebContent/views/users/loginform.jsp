<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login.do">
	<label for="id">아이디</label>
	<input type="text" name="id" id="user_id"/>
	<label for="pwd">비밀번호</label>
	<input type="text" name="pwd" id="user_password"/>
	<button type="submit" id="btn_login">로그인</button>
</form>
</body>
</html>