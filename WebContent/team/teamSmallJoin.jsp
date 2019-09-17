<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.TeamSmall" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked") 
   List<TeamSmall> TeamSmallList = (List<TeamSmall>)request.getAttribute("TeamSmallList");
   String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>팀스몰 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>

function teamSmallCreate() {

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
<script type="text/javascript">
function setFocus(Sender){
  if (Sender.value == Sender.defaultValue) {Sender.value = '';}
}

function setBlur(Sender){
  if (Sender.value == '') {Sender.value = Sender.defaultValue;}
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
<body bgcolor=#F5FFFA text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form  -->
<form name="form" method="POST" action="<c:url value='/team/teamSmalljoin' />">
	<table style="margin-left: auto; margin-right: auto;">
    	<tr>
      		<td width="20"></td>
    		<td>
       			<table>
        			<tr>
          				<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>팀 개설</b>&nbsp;&nbsp;</td>
       				</tr>
       			</table><br>     
       			<table style="background-color: YellowGreen">
       				<tr height="40">
				         <td width="150" align="center" bgcolor="F0FFF0">팀이름</td>
				         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
				            <input type="text" style="width: 240" name="teamname">
				         </td>
        			</tr>   
			        <tr height="40">
			         	<td width="150" align="center" bgcolor="F0FFF0">활동분야</td>
			         	<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
			            	<input type="radio" name="checkfield" value="1"> IT &nbsp;&nbsp;&nbsp;
							<input type="radio" name="checkfield" value="2"> 수학 &nbsp;&nbsp;&nbsp;
							<input type="radio" name="checkfield" value="3"> 기계 &nbsp;&nbsp;&nbsp;
							<input type="radio" name="checkfield" value="4"> 어문 
							<input type="radio" name="checkfield" value="5"> 마케팅 &nbsp;&nbsp;&nbsp;
							<input type="radio" name="checkfield" value="6"> 디자인 &nbsp;&nbsp;&nbsp;
							<input type="radio" name="checkfield" value="7"> 미디어 &nbsp;&nbsp;&nbsp;
			          	</td>
        			</tr>   
					<tr height="40">
			         	<td width="150" align="center" bgcolor="F0FFF0">만나는 위치</td>
			         	<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
			            	<input type="text" style="width: 240" name="meetingLoc">
			         	</td>
        			</tr>   
			        <tr height="40">
			         	<td width="150" align="center" bgcolor="F0FFF0">종료날짜</td>
			         	<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
			         	<input value="YYYY/MM/DD" onfocus="setFocus(this)" onblur="setBlur(this)" type="text"
			         		style="width: 240" name="endDate">
						</td>
			     	</tr>
       			</table><br>     
       			<table style="margin-left: auto; margin-right: auto;">
        			<tr>
				         <td align="left">
					         <input type="button" value="팀 등록" onClick="teamSmallCreate()"> &nbsp;
					         <input type="button" value="팀 목록보기" onClick="teamList('<c:url value='/team/teamSmallList' />')">
				         </td>
					</tr>
       			</table>
     		</td>
    	</tr>
  	</table>  
</form>
</body>
</html>