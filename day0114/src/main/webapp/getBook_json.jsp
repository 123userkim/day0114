<%@page import="com.sist.vo.BookVO"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	//int bookid = 1;
	BookDAO dao = new BookDAO();
	BookVO b= dao.getBook(bookid);
	
	
	String result = "{\"bookname\":\""+b.getBookname()
		+"\",\"publisher\":\""+b.getPublisher()+"\",\"price\":"+b.getPrice()+"}";
%>
 
<%= result %>
