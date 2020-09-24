<%@page import="com.intime.feria.dao.UsersDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.intime.feria.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<User> users = UsersDAO.selectUserList();
	ObjectMapper om = new ObjectMapper();
	
	String json = om.writeValueAsString(users);
%>
<%=json%>