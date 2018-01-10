<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>아이디찾기 페이지입니다.</h3>
<form action="search.do">
	<label for="email">가입시 입력한 이메일을 입력해주세요</label>
	<input type="text" name="search_email" id="search_email"/>
	<button type="submit">찾기</button>
</form>
<a href="${pageContext.request.contextPath }">인덱스로 가기</a>
</body>
</html>