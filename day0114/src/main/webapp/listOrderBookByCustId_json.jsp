<%@page import="com.sist.vo.OrderBookinfo"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.sist.vo.OrderBookinfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.vo.BookVO"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int custid = Integer.parseInt(request.getParameter("custid"));
//	int custid = 1;
	BookDAO dao = new BookDAO();
	ArrayList<OrderBookinfo> list = dao.listOrderBook(custid);
	Gson gson = new Gson();
	String result = gson.toJson(list);

%>
<%= result %>