<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<Report> reportList = (List<Report>)request.getAttribute("reportList"); 
	String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>팀 리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
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

<script>
function back()
{ 
	history.go(-1);
}

function mentorList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>

<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table style="width:100%; margin-left: auto; margin-right: auto;"> 
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="20"></td>
		<td>
	  	<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>보고서 리스트</b>&nbsp;&nbsp;</td>
			</tr>
		</table>  
	  <br>		  
	  <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;"> 
		<tr>
		  <td width="190" align="center" bgcolor="E6ECDE" height="22">순서</td>
		  <td width="200" align="center" bgcolor="E6ECDE">최종 수정일</td>
		  <td width="200" align="center" bgcolor="E6ECDE">보고서URL</td>
		  <td width="200" align="center" bgcolor="E6ECDE">영수증URL</td>
		</tr>
<%  
	if (reportList != null) {
		int count = 1;
	  Iterator<Report> reportIter = reportList.iterator();

	  while ( reportIter.hasNext() ) {
		  Report report = (Report)reportIter.next();
		  String rptnum = Integer.toString(report.getRptnum());
		  String url = report.getUrl();
		  String rcp = report.getUrl_rcp();
		  int idx = url.indexOf("/");
		  String filename = url.substring(idx + 1);		//보고서
		  String filename2 = rcp.substring(idx + 1);	//영수증
%>  	
		<tr>
			<td width="190" align="center" bgcolor="ffffff" height="20">
			<%=count%>
			</td>
			
			<td width="200" align="center" bgcolor="ffffff" height="20">
			<%=report.getRptUpdate()%>	  
		  	</td>
		  
		   	<td width="200" align="center" bgcolor="ffffff" height="20">
			<%=filename%>	  
		  	</td>
		  
		   	<td width="200" align="center" bgcolor="ffffff" height="20">
			<%=filename2%>	  
		  	</td>
		  	
		 </tr>
<%
	  count++;}
	}
%>	  	
	  </table>	  	 
	  <br>   	  
	</td>
  </tr>
</table>
<div style="text-align: center;">
<input type="button" value="이전 페이지로 돌아가기" onClick="javascript:back()">
</div>
</body>
</html>