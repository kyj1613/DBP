<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.TeamSmall" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked") 
   List<TeamSmall> TeamSmallList = (List<TeamSmall>)request.getAttribute("TeamSmallList");
   String curUserId = (String)request.getAttribute("curUserId");
   String Teamname = (String)request.getAttribute("Teamname");
%>
<html>
<head>
<title>멘티 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>

function menteeCreate() {
   
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
		<a href="<c:url value='/mypage/mypage'><c:param name='curUserId' value='<%=curUserId%>'/></c:url>">
      <img src="<c:url value='/images/mypage_logo.png' />" width='50px' height='50px' /></a>
          : <%=curUserId%>
		 <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a></h3>
 <h3>
     가입하고자 하는 팀 이름 :
      <%=Teamname%></h3>     
<body bgcolor=#F5FFFA text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form  -->
<form name="form" method="GET" action="<c:url value='/teamLarge/teamLargeAttend' />">
  <table style="width: 100%">
    <tr>
      <td width="20"></td>
     <td>
       <table>
        <tr>
          <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>팀 개설</b>&nbsp;&nbsp;</td>
        </tr>
       </table>  
       
       <br>     
       <table style="background-color: YellowGreen">
       <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">가입하고자 하는 팀 이름</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <%=Teamname%>
         </td>
        </tr>   
        <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">수강생ID</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <%=curUserId%>
               
         </td>
        </tr>   
        
       </table>
       <br>     
       <table style="width: 100%">
        <tr>
         <td align="left">
         <input type="button" value="팀 등록" onClick="menteeCreate()"> &nbsp;
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