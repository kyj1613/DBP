<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.TeamSmall" %>
<%@page language="java" pageEncoding="euc-kr" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked") 
   List<TeamSmall> TeamSmallList = (List<TeamSmall>)request.getAttribute("TeamSmallList");
   String curUserId = (String)request.getAttribute("curUserId");
%>

<html>
<head>
<title>���� ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css'/>" type="text/css">

<script>
function back()
{ 
	history.go(-1);
}

function reportList(targetUri) {
   form.action = targetUri;
   form.submit();
}
</script>
</head>

<h3>
<div style="text-align:right">
   <a href="<c:url value='/mypage/mypage'><c:param name='curUserId' value='<%=curUserId%>'/></c:url>">
      <img src="<c:url value='/images/mypage_logo.png' />" width='50px' height='50px' /></a>
          : <%=curUserId%>
       <a href="<c:url value='/member/logout' />">(�α׾ƿ�)&nbsp;&nbsp;</a>
</div>
</h3>

<div style="text-align:center">    
   <a href="<c:url value='/main/mainpage' />">
   <img src="<c:url value='/images/logo.png' />" /></a>   
</div>  

<body bgcolor=#F5FFFA text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>

<!-- registration form -->
<form name="form" method="POST" action="<c:url value='/report/reportJoin' />" enctype="multipart/form-data">
	<table style="width: 100%">
    <tr>
    	<td width="20"></td>    	
    	<table style="margin-left: auto; margin-right: auto;">
        <tr>
        	<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>���� ���</b>&nbsp;&nbsp;</td>
        </tr>
       </table>  
       <br>     
       <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
       <tr height="40">
       		<td width="150" align="center" bgcolor="F0FFF0">����URI</td>
        	<td width="250" bgcolor="F5FFFA" style="padding-left: 50">
            <input type="file" style="width: 240" name="Url">
  			</td>
       </tr>
       <tr height="40">
         	<td width="150" align="center" bgcolor="F0FFF0">������URI</td>
         	<td width="250" bgcolor="F5FFFA" style="padding-left: 50">
            <input type="file" style="width: 240" name="Url_rcp">
         	</td>
       </tr>   
       <tr height="40">
         	<td width="150" align="center" bgcolor="F0FFF0">���ݾ�</td>
         	<td width="250" bgcolor="F5FFFA" style="padding-left: 30">
            <input type="text" style="width: 240" name="expense">
         	</td>
       </tr>   
       </table>
       <br>     
       <table style="margin-left: auto; margin-right: auto;">
       <tr>
         	<td>
         	<input type="submit" value="���� ���"> &nbsp;
         	<input type="button" value="���" onClick="reportList('<c:url value='/report/reportList' />')">
         	</td>
       </tr>
       </table>
    </tr>
  </table>  
</form>
<!-- registration form -->

<div style="text-align: center;">
<input type="button" value="���� �������� ���ư���" onClick="javascript:back()">
</div>
</body>
</html>