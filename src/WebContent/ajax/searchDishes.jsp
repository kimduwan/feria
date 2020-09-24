<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.intime.feria.dao.DishesDAO"%>
<%@page import="com.intime.feria.vo.Dish"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List<Dish> dishes = DishesDAO.selectList();
	ObjectMapper om = new ObjectMapper();
	
	String json = om.writeValueAsString(dishes);
%>
<%=json%>