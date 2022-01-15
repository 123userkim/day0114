<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("button").click(function(){	
			$("tbody").empty();
			$.ajax({
				url:"listOrderBookByCustId_json.jsp",
				data:{custid:$("#custid").val()},
				success:function(arr){
					$.each(arr, function(){
						let td1 = $("<td></td>").html( this.bookid );
						let td2 = $("<td></td>").html( this.bookname );
						let td3 = $("<td></td>").html( this.publisher );
						let td4 = $("<td></td>").html( this.orderdate );
						let td5 = $("<td></td>").html( this.price );
						let td6 = $("<td></td>").html( this.saleprice );
						
						let tr = $("<tr></tr>").append(td1,td2,td3,td4,td5,td6);
						$("tbody").append(tr);
					});
				}
			});
		});
	});
</script>
</head>
<body>
	고객번호 : <input type="text" id="custid">
	<button>주문도서 확인</button>
	<br>
	<h2>주문 도서 목록</h2>
	<hr>
	<table border="1" width="80%">
		<thead>
			<!-- 도서번호, 도서명, 출판사명, 구매일, 도서가격, 구매가격 -->
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>출판사명</th>
				<th>구매일</th>
				<th>도서가격</th>
				<th>구매가격</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</body>
</html>