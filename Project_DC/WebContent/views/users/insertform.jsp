<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
</head>
<body>
<h3>회원가입 페이지 입니다.</h3>
<form action="insert.do">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id" />
	<button id="check">중복확인</button><br/>
	<label for="pwd">비밀번호</label>
	<input type="text" name="pwd" id="pwd" /><br/>
	<label for="email">이메일</label>
	<input type="text" name="email" id="email" /><br/>
	<button type="submit" id="check_1">가입</button>
</form>
<script>
	$("#check_1").attr("disabled",true);

	$("#check").click(function(){
		var msg=$("#id").val();
		$.ajax({
			method:"post",
			url:"check.do",
			data:{msg:msg},
			success:function(data){
				if(data.response) {
					alert("사용중인 아이디입니다.")
					$("#id").val("");
					$("#id").focus();
				}else{
					alert("사용가능한 아이디입니다.")
					$("#check_1").attr("disabled",false);
				}
			}
		});
		return false;
	});
</script>
</body>
</html>