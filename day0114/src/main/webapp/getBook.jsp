<%@page import="com.sist.vo.BookVO"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/plaine; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int bookid = Integer.parseInt(request.getParameter("bookid"));
BookDAO dao = new BookDAO();
	BookVO b= dao.getBook(bookid);

%>
 
<%= b.getBookname()%>,<%=b.getPublisher()%>,<%=b.getPrice()%>
