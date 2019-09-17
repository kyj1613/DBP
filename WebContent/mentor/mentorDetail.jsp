<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

@SuppressWarnings("unchecked")
	Mentor mentor = (Mentor)request.getAttribute("mentor");
	List<Mentor> mentorList = (List<Mentor>)request.getAttribute("mentorList");
	String curUserId = (String)request.getAttribute("curUserId");
%>

<html>

<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>

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
		 <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a>
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
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>멘토 상세정보 보기</b>&nbsp;&nbsp;</td>
			  		</tr>
		    	</table><br>	  	    
		  		<table style="background-color: YellowGreen">
		  	  	  	<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">이름</td>
						<td width="300" align="center" bgcolor="ffffff" style="padding-left: 10">
							<%=mentor.getMember().getName()%>
						</td>
					</tr>
			  		<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">활동분야</td>
						<td width="300" align="center" bgcolor="ffffff" style="padding-left: 10">
							${fname }
						</td>
					</tr>		  
				  	<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">자기소개</td>
						<td width="300" align="center" bgcolor="ffffff" style="padding-left: 10">
							<%=mentor.getProfile()%>
						</td>
					</tr>	
		 		</table>
		 	</td>
		</tr>
  	</table><br>
	<center><input type="button" value="멘토 목록으로 돌아가기" onClick="javascript:back()"></center>
</body>
</html>