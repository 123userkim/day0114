<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//출판사명을 전달받아 
	//해당 출판사에서 출간하는 모든 도서목록을 xml로 응답하도록  
	
	String publisher = request.getParameter("publisher");
	//String publisher = "굿스포츠";
	BookDAO dao = new BookDAO();
	ArrayList<BookVO> list = dao.listBookPublisher(publisher);
	String result = "<list>";
	for(BookVO b:list){
		result += "<book>";
		result += "<bookid>"+b.getBookid()+"</bookid>";
		result += "<bookname>"+b.getBookname()+"</bookname>";
		result += "<publisher>"+b.getPublisher()+"</publisher>";
		result += "<price>"+b.getPrice()+"</price>";
		result += "</book>";
	}
	result += "</list>";
%>
<%= result %>