<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<Waiting> waitingList = (List<Waiting>)request.getAttribute("waitingList"); 
	String curUserId = (String)request.getAttribute("curUserId");
	String Teamname = (String)request.getAttribute("Teamname");
%>
<html>
<head>
<title>멘티 신청하기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>

function menteeRequest() {
	form.submit();
}

function back()
{ 
	history.go(-1);
}


function teamList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
</head>

<h3>
		로그인 아이디 :
		<%=curUserId%>
		 <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a></h3>
<h3>
		팀이름  :
		<%=Teamname%></h3>
		<div style="text-align:center">    
   <a href="<c:url value='/main/mainpage' />">
   <img src="<c:url value='/images/logo.png' />" /></a>   
</div>  
		
<body bgcolor=#F5FFFA text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form  -->
<form name="form" method="POST" action="<c:url value='/team/teamSmallRequest' />">
  <table style="width: 100%">
    <tr>
      <td width="20"></td>
	  <td>
	    <table>
		  <tr>
		    <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>멘티 신청하기</b>&nbsp;&nbsp;</td>
		  </tr>
	    </table>  
	    <br>	 
	    <br>	  
	    <table style="background-color: YellowGreen">
	   
		  <tr height="40">
			<td width="150" align="center" bgcolor="F0FFF0">멘티 가입 id</td>
			<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
				<input type="text" style="width: 240" name="mentee">
			</td>
		  </tr>	
		 
	  	  
	    </table>
	    <br>	  
	    <table style="width: 100%">
		  <tr>
			<td align="left">
			<input type="button" value="멘티등록" onClick="menteeRequest()"> &nbsp;
			<input type="button" value="목록" onClick="teamList('<c:url value='/team/teamSmallList' />')">
			</td>
		  </tr>
	    </table>
	  </td>
    </tr>
  </table>  
</form>
 <input type="button" value="이전 페이지로 돌아가기" onClick="javascript:back()">
</body>
</html>