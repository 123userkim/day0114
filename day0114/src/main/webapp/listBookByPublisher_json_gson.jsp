<%@page import="com.google.gson.Gson"%>
<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String publisher = request.getParameter("publisher");
	//String publisher = "굿스포츠";
	BookDAO dao = new BookDAO();
	ArrayList<BookVO> list = dao.listBookPublisher(publisher);
	Gson gson = new Gson();
	String result = gson.toJson(list);
%>
<%= result %>