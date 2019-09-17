 <%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<Mentor> mentorRecommendList1 = (List<Mentor>)request.getAttribute("mentorRecommendList1"); 
	String curUserId = (String)request.getAttribute("curUserId");
	List<String> fieldNameList = (List<String>)request.getAttribute("fieldNameList"); 
%>
<html>
<head>
<title>팀리스트</title>
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
		로그인 아이디 :
		<%=curUserId%>
		 <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a></h3>
		 
		
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>


<br>
<table style="width:100%">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
	<td width="20"></td>
	<td>
	  <table>
		<tr>
		  <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>팀 관리 - 리스트</b>&nbsp;&nbsp;</td>
		</tr>
	  </table>  
	  <br>		  
	  필드이름:<%=fieldNameList.get(0) %>
	  <table style="background-color: YellowGreen">
		<tr>
		  <td width="190" align="center" bgcolor="E6ECDE" height="22">멘토이름 (ID)</td>
		  
		  <td width="200" align="center" bgcolor="E6ECDE">별점</td>
		  <td width="200" align="center" bgcolor="E6ECDE">멘토 활동경험 횟수</td>
		
		  
		</tr>
<%  
	if (mentorRecommendList1 != null) {	
	  Iterator<Mentor> MentorIter = mentorRecommendList1.iterator();

	  while ( MentorIter.hasNext() ) {
		  Mentor mentor = (Mentor)MentorIter.next();
%>	  	
		<tr>
		  
		  <td width="190" align="center" bgcolor="ffffff" height="20">
		  	<a href="<c:url value='/team/teamSmallDetail'>
					   <c:param name='Teamname' value='<%=mentor.getMember().getName()%>'/>
			 		 </c:url>">
			<%=mentor.getMember().getName()%></a> (<%=mentor.getMember().getId()%>)
		  </td>
		  <td width="190" align="center" bgcolor="ffffff" height="20">
			<%=mentor.getStar()%>
		  </td>
		  <td width="190" align="center" bgcolor="ffffff" height="20">
			<%=mentor.getHistory()%>
		  </td>
		  
		  
		  
		  
		</tr>
<%
	  }
	}
%>	  	
	  </table>	  	 
	  <br>   
	  
	</td>
  </tr>
</table>


<input type="button" value="돌아가기" onClick="javascript:back()">
</body>
</html>