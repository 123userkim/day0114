package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.db.ConnectionProvider;
import com.sist.vo.BookVO;
import com.sist.vo.OrderBookinfo;

public class BookDAO {
	
	//고객명을 매개변수로 전달받아 해당 고객이 주문한 도서번호, 도서명, 출판사명, 구매일, 도서가격,구매가격
	//반환하는 메소드 정의
	public ArrayList<OrderBookinfo>listOrderBook(int custid){
		ArrayList<OrderBookinfo>list =  new ArrayList<OrderBookinfo>();
		String sql ="select b.bookid, bookname, publisher, orderdate, price, saleprice from book b, customer c, orders o where b.bookid= o.bookid and c.custid= o.custid and c.custid=?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custid);
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new OrderBookinfo(rs.getInt(1),rs.getString(2),
						rs.getString(3),rs.getDate(4),
						rs.getInt(5),rs.getInt(6)));
			}
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return list;
	}
	
	
	
	//출판사명을 매개변수로 전달받아서 해당출판사에서 출간하는 모든 도서목록을 반환
	public ArrayList<BookVO> listBookPublisher(String publisher){		
	ArrayList<BookVO>list =new ArrayList<BookVO>();
	
		String sql = "select * from book where publisher=?";
		try {
			
			Connection conn= ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		 
			pstmt.setString(1, publisher);
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {

				 list.add(new BookVO(rs.getInt(1), rs.getString(2),  rs.getString(3),  rs.getInt(4) ));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}		 
		return list;		
	}
	
	//도서번호를 매개변수로 전달받아서 해당 정보를 bookVO로 반환하는 메소드를 정의함
	public BookVO getBook(int bookid){		
		BookVO b= null;		
		String sql = "select * from book where bookid=?";
		try {
			
			Connection conn= ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		 
			pstmt.setInt(1, bookid);
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()) {
				 b = new BookVO(
						 rs.getInt(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getInt(4)						 
						 );
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}		 
		return b;		
	}
	
	public int getPrice(String bookname, String publisher) {
		int price = 0; 
		String sql = "select price from book where bookname=? and publisher=?";		  
		
		try {
			Connection conn= ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		 
			pstmt.setString(1, bookname);
			pstmt.setString(2, publisher);
			ResultSet rs =pstmt.executeQuery();
			
			if(rs.next()) {
				price= rs.getInt(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return price;
		
	}
}
