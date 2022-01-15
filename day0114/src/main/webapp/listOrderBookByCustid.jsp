<%@page import="com.thoughtworks.xstream.XStream"%>
<%@page import="com.sist.vo.OrderBookinfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   int custid = Integer.parseInt(request.getParameter("custid"));
   //int custid = 1;
   BookDAO dao = new BookDAO();
   ArrayList<OrderBookinfo> list = dao.listOrderBook(custid);
   XStream xStream = new XStream();
   xStream.alias("book",OrderBookinfo.class);
   
%>
<%= xStream.toXML(list) %>

