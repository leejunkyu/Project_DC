<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg=request.getParameter("msg");
	boolean result=UsersDao.getInstance().check(msg);
	
%>
<%if(result) {%>
	{"response":true}
<%}else{ %>
	{"response":false}
<%} %>