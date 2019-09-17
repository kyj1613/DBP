<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
      TeamSmall teamSmall = (TeamSmall)request.getAttribute("teamSmall");
      Mentor mentor = (Mentor)request.getAttribute("mentor");    
      List<Mentee> MenteeList = (List<Mentee>)request.getAttribute("MenteeList");    
      String fieldname = (String)request.getAttribute("fieldname");
      String Teamname = (String)request.getAttribute("Teamname");
      String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>팀 세부사항</title>
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
      
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table style="width:100%; margin-left: auto; margin-right: auto;">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
   <td width="20"></td>
   <td>
     <table style="margin-left: auto; margin-right: auto;">
      <tr>
        <td text-align="center" bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=Teamname%>팀 상세정보</b>&nbsp;&nbsp;</td>
      </tr><tr><tr>
      <tr>
       <td><%=Teamname%>팀의 남은 지원금은 <b><%=teamSmall.getSupport()%></b>원입니다.</td>
      </tr>
     </table>  
     <br>        
     
     <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
      <tr>
        <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
        <td width="190" align="center" bgcolor="ffffff" height="20">
         <%=teamSmall.getName()%>     
        </td>
      </tr>
      <tr>
        <td width="190" align="center" bgcolor="E6ECDE" height="22">멘토이름</td>
         <td width="200" align="center" bgcolor="ffffff" height="20">
          <%=mentor.getMember().getName()%>     
        </td>
      </tr>
      <tr>
        <td width="190" align="center" bgcolor="E6ECDE" height="22">활동분야</td>
         <td width="200" align="center" bgcolor="ffffff" height="20">
          <%=fieldname%>     
        </td>
      </tr>
      <tr>
        <td width="200" align="center" bgcolor="E6ECDE">만나는위치</td>
         <td width="200" align="center" bgcolor="ffffff" height="20">
         <%=teamSmall.getMeetingLoc()%>     
        </td>
      </tr>               
      <tr>
        <td width="200" align="center" bgcolor="E6ECDE">멘티</td>
        <td width="200" align="center" bgcolor="ffffff" height="20">
  <c:forEach var="mentee" items="${MenteeList}" varStatus="status"> 
  ${mentee.member.name }<c:if test="${!status.last}">,</c:if>
  </c:forEach>
  </td> 
      </tr>
     </table>          
     <br>   
     <br>      
     <table style="margin-left: auto; margin-right: auto;">
     <tr>
      <td>
       <a href="<c:url value='/team/teamDelete' />">팀 삭제 &nbsp;&nbsp;&nbsp;&nbsp;</a>
          <a href="<c:url value='/team/teamLeave' />">멘티 팀 탈퇴&nbsp;&nbsp;&nbsp;&nbsp;</a>
          <a href="<c:url value='/report/reportList' />">보고서 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a>
          <a href="<c:url value='/report/reportJoin/form' />">보고서 리스트등록</a>
        </td>
      </tr>
     </table>
     <br>          
   </td>
  </tr>
</table>
</body>
</html> 
