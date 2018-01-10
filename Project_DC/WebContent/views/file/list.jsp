<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/file/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<a href="private/insertform.do">파일 업로드</a>
	<h3>파일 목록입니다.</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일</th>
				<th>크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td>${tmp.title }</td>
					<td><a href="download.do?num=${tmp.num }">${tmp.orgFileName }</a></td>
					<td><fmt:formatNumber value="${tmp.fileSize }"/> byte</td>
					<td>${tmp.regdate }</td>
					<td>
						<!-- 로그인된 아이디가 글 작성자와 같을때만 삭제 링크 출력 -->
						<c:if test="${id eq tmp.writer }">
							<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" 
				end="${endPageNum }">	
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active"><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	<div class="row">
		<div class="col-xs-6">
			<!-- 검색어 관련 form -->
			<form action="list.do" method="post">
				<input type="hidden" id="condition" value="${condition }" name="condition" />
		        <div class="input-group">
		          <div class="input-group-btn">
		            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		              <span id="conditionBtn">제목+파일명</span>
		              <span class="caret"></span>
		            </button>
		            <ul class="dropdown-menu">
		              <li><a href="javascript:set('titlecontent')">제목+파일명</a>
		              </li>
		              <li><a href="javascript:set('title')">제목</a>
		              </li>
		              <li><a href="javascript:set('writer')">작성자</a>
		              </li>
		            </ul>
		          </div>
		          <!-- /btn-group -->
		          <input type="text" id="keyword" name="keyword" value="${keyword }" class="form-control"/>
		          	<span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			              <span class="sr-only">검색</span>
			              <span class="glyphicon glyphicon-search"></span>
			            </button>
          			</span>
		        </div>			
			</form>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
	
	set("${condition}");
	
	function set(condition){
		if(condition=="titlecontent" || condition==""){
			condition="titlecontent";
			$("#conditionBtn").text("제목+파일명");
		}else if(condition=="title"){
			$("#conditionBtn").text("제목");
		}else if(condition=="writer"){
			$("#conditionBtn").text("작성자");
		}
		$("#condition").val(condition);
	}
	
	function deleteConfirm(num){
		var result=confirm(num+" 번 파일을 삭제 하시겠습니까?");
		if(result){
			location.href="private/delete.do?num="+num;
		}
	}
</script>
</body>
</html>





