<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<Review> reviewList = (List<Review>)request.getAttribute("reviewList");
	String curUserId = (String)request.getAttribute("curUserId");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel=stylesheet href="<c:url value='/css/menu.css' />" type="text/css">
<title>후기게시판</title>
</head>
<h3>
<div style="text-align:right">
로그인 아이디 :<%=curUserId%>
<a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a>
</h3> 
</div>

<div style="text-align:center">    
   <a href="<c:url value='/main/mainpage' />">
   <img src="<c:url value='/images/logo.png' />" />
   </a>   
</div>  

<body>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead> <!-- table의 제목부분 -->
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						
					</tr>
				</thead>

				<tbody>
<%  
	if (reviewList != null) {	
	  Iterator<Review> ReviewIter = reviewList.iterator();

	  while ( ReviewIter.hasNext() ) {
		  Review review = (Review)ReviewIter.next();
		  
		  String revnum = Integer.toString(review.getRevnum());
%>
					<tr> <!-- 예시data -->
						<td><%=review.getRevnum()%></td>
						<td><a href="<c:url value='/review/reviewDetail'>
					   			<c:param name='reviewnum' value='<%=revnum%>'/>
			 		 			</c:url>">
						<%=review.getRevtitle()%></a></td>
						<td><%=review.getMember().getName()%></td>
						<td><%=review.getRevdate()%></td>
						<td><%=review.getCnt()%></td>
						
					</tr>
					
					<%}
						}
					%>
					
				</tbody>
			</table>
			<a href="<c:url value='/review/reviewJoin/form' />" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
</body>
</html>