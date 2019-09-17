<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
@SuppressWarnings("unchecked")
	Location location = (Location)request.getAttribute("location");
	List<RentHis> rentHisList = (List<RentHis>)request.getAttribute("rentHisList");
	List<RentHis> rentHisList2 = (List<RentHis>)request.getAttribute("rentHisList2");
	List<RentHis> rentHisList3 = (List<RentHis>)request.getAttribute("rentHisList3");
	String isNotMentor = (String)request.getAttribute("isNotMentor");
	String curUserId = (String)request.getAttribute("curUserId");
%>

<html>

<head>
<title>장소 대여 내역</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function rentCreate(targetUri) {
	form.action = targetUri;
	form.submit();
}
function back()
{ 
	history.go(-1);
}

</script>
</head>	
<h3>
	<div style="text-align:right">
    	<a href="<c:url value='/mypage/mypage'><c:param name='curUserId' value='<%=curUserId%>'/></c:url>">
    	<img src="<c:url value='/images/mypage_logo.png' />" width='50px' height='50px' /></a>
          : <%=curUserId%>
       	<a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;&nbsp;&nbsp;</a>
	</div>
</h3>  
<div style="text-align:center">    
   <a href="<c:url value='/main/mainpage' />">
   <img src="<c:url value='/images/logo.png' />" /></a>   
</div> 
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>

<table style="margin-left: auto; margin-right: auto;">
    <tr>
	  	<td width="20"></td>
	  	<td>
	    	<table>
			  	<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>장소 대여 내역 보기</b>&nbsp;&nbsp;</td>
			  	</tr>
		    </table><br>	  	    
	  		<table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
	  	  		<tr>
					<td width="120" align="center" bgcolor="E6ECDE" height="22">지점 이름</td>
					<td width="470" bgcolor="ffffff" style="padding-left: 10">
						<%=location.getLocname()%> <%=location.getLocnum()%>호점 
					</td>
		  		</tr>
		  	 	<tr>
					<td width="120" align="center" bgcolor="E6ECDE" height="22">주소</td>
					<td width="470" bgcolor="ffffff" style="padding-left: 10">
						<%=location.getAddress()%>
					</td>
		  		</tr>	
	 		</table><br>
	 		<table style="margin-left: auto; margin-right: auto;">
	 			<tr>
	 				<td align = "right">
	 				
	 					<% 
            if (isNotMentor.equals("true")) { %>
           <a href="<c:url value='/rent/rentPlaceRequest/form' />">장소 대여 신청</a>
          <% } %>
	 				
	 					
	 					&nbsp;<input type="button" value="지점 목록으로 돌아가기" onClick="javascript:back()">
	 				</td>
	 			</tr>
	 		</table><br>
	    </td>
	</tr>
</table>  

<table style="margin-left: auto; margin-right: auto;">
    <tr>
	  	<td width="20"></td>
	  	<td>
	    	<table>
			  	<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>1번방 대여내역 보기</b>&nbsp;&nbsp;</td>
			  	</tr>
	    	</table><br>	  	    
	  		<table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
				<tr>
				  	<td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
				  	<td width="200" align="center" bgcolor="E6ECDE">날짜</td>
				  	<td width="200" align="center" bgcolor="E6ECDE">시간</td>
				</tr>
				<%  
					if (rentHisList != null) {	
					  Iterator<RentHis> rentHisIter = rentHisList.iterator();
				
					  while ( rentHisIter.hasNext() ) {
						  RentHis rentHis = (RentHis)rentHisIter.next();
				%>		  	  
	  	 	 	<tr>
		  			<td width="200" align="center" bgcolor="ffffff" height="20">
						<%=rentHis.getTeamSmall().getName()%>	  
			  		</td>
			  		<td width="200" align="center" bgcolor="ffffff" height="20">
						<%=rentHis.getRdate()%>	  
			  		</td>
			  		<td width="200" align="center" bgcolor="ffffff" height="20">
						<%=rentHis.getRtime()%>	  
			  		</td>
			  	</tr>	
				<%
					  }
					}
				%>
	 		</table>
		</td>
	</tr>
</table><br>
<table style="margin-left: auto; margin-right: auto;">
    <tr>
	  	<td width="20"></td>
	  	<td>
	    	<table>
		  		<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>2번방 대여내역 보기</b>&nbsp;&nbsp;</td>
		  		</tr>
	    	</table><br>	  	    
	  		<table style="background-color: YellowGreen">
				<tr>
				  	<td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
				  	<td width="200" align="center" bgcolor="E6ECDE">날짜</td>
				  	<td width="200" align="center" bgcolor="E6ECDE">시간</td> 
				</tr>
				<%  
					if (rentHisList2 != null) {	
					  Iterator<RentHis> rentHisIter = rentHisList2.iterator();
				
					  while ( rentHisIter.hasNext() ) {
						  RentHis rentHis = (RentHis)rentHisIter.next();
				%>		  	  
					  	  <tr>
							  <td width="200" align="center" bgcolor="ffffff" height="20">
									<%=rentHis.getTeamSmall().getName()%>	  
							  </td>
							  <td width="200" align="center" bgcolor="ffffff" height="20">
									<%=rentHis.getRdate()%>	  
							  </td>
							  <td width="200" align="center" bgcolor="ffffff" height="20">
									<%=rentHis.getRtime()%>	  
							  </td>
						  </tr>	
				<%
					  }
					}
				%>
	 		</table>
		</td>
	</tr>
</table><br>
<table style="margin-left: auto; margin-right: auto;">
    <tr>
	  	<td width="20"></td>
	  	<td>
	    	<table>
		  		<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>3번방 대여내역 보기</b>&nbsp;&nbsp;</td>
		  		</tr>
	    	</table><br>	  	    
	  		<table style="background-color: YellowGreen">
				<tr>
				  	<td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
				  	<td width="200" align="center" bgcolor="E6ECDE">날짜</td>
				 	<td width="200" align="center" bgcolor="E6ECDE">시간</td>
				</tr>
				<%  
					if (rentHisList3 != null) {	
					  Iterator<RentHis> rentHisIter = rentHisList3.iterator();
				
					  while ( rentHisIter.hasNext() ) {
						  RentHis rentHis = (RentHis)rentHisIter.next();
				%>		  	  
					  	  <tr>
							  <td width="200" align="center" bgcolor="ffffff" height="20">
									<%=rentHis.getTeamSmall().getName()%>	  
							  </td>
							  <td width="200" align="center" bgcolor="ffffff" height="20">
									<%=rentHis.getRdate()%>	  
							  </td>
							  <td width="200" align="center" bgcolor="ffffff" height="20">
									<%=rentHis.getRtime()%>	  
							  </td>
						  </tr>	
				<%
					  }
					}
				%>
	 		</table>
		</td>
	</tr>
</table>
</body>
</html>