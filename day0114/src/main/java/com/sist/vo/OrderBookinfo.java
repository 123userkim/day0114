package com.sist.vo;

import java.sql.Date;

public class OrderBookinfo {
	//도서번호, 도서명, 출판사명, 구매일, 도서가격,구매가격
	
	private int bookid;
	private String bookname;
	private String publisher;
	private Date orderdate;
	private int price;
	private int saleprice;
	
	
	public OrderBookinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderBookinfo(int bookid, String bookname, String publisher, Date orderdate, int price, int saleprice) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.publisher = publisher;
		this.orderdate = orderdate;
		this.price = price;
		this.saleprice = saleprice;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	
	
	
}
