<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 @SuppressWarnings("unchecked") 
 String curUserId = (String)request.getAttribute("curUserId");
 List<TeamSmall> teamSmallNameList = (List<TeamSmall>)request.getAttribute("teamSmallNameList"); 
 List<TeamSmall> teamSmallNameMentorList = (List<TeamSmall>)request.getAttribute("teamSmallNameMentorList"); 
 List<Waiting> waitingList = (List<Waiting>)request.getAttribute("waitingList");
 List<TeamLarge> teamLargeList = (List<TeamLarge>)request.getAttribute("teamLargeList");
 List<TeamLarge> teamLargeMentorList = (List<TeamLarge>)request.getAttribute("teamLargeMentorList"); 

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
<table style="width:100%">
 <tr>
  <td width="20"></td>
  <td>
     <table style="margin-left:auto; margin-right: auto;">
      <tr>
       <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리 - 상세정보 보기</b>&nbsp;&nbsp;</td>
      </tr>
     </table>  
     <br>        
    <table style="background-color: YellowGreen; margin-left:auto; margin-right: auto;">
    <tr>
     <td width="150" align="center" bgcolor="E6ECDE" height="22">사용자ID</td>
   <td width="200" align="center" bgcolor="ffffff">
    ${member.id}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">이름</td>
   <td align="center" bgcolor="ffffff">
    ${member.name}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">패스워드</td>
   <td align="center" bgcolor="ffffff">
    ${member.password}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">성별</td>
   <td align="center" bgcolor="ffffff">
    ${member.sex}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">닉네임</td>
   <td align="center" bgcolor="ffffff">
    ${member.nickname}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">전화번호</td>
   <td align="center" bgcolor="ffffff">
    ${member.tel}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">생년월일</td>
   <td align="center" bgcolor="ffffff">
    ${member.birth}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">이메일</td>
   <td align="center" bgcolor="ffffff">
    ${member.email}
   </td>
  </tr>
  <tr>
   <td align="center" bgcolor="E6ECDE" height="22">관심분야</td>
   <td align="center" bgcolor="ffffff">
   <c:forEach var="fieldname" items="${fieldNameList}" varStatus="status">
    ${fieldname}<c:if test="${!status.last}">,</c:if>
   </c:forEach>
   </td>
  </tr>
   </table>
   </td>
 </tr>
</table>  
<br>

<table style="width:100%">
 <tr>
  <td>&nbsp;</td><td>&nbsp;</td>
 </tr>
 <tr>
  <td width="20"></td>
  <td>
    <table style="margin-left: auto; margin-right: auto;">
   <tr>
    <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>멘토링 팀 멘티 활동 내역</b>&nbsp;&nbsp;</td>
   </tr>
  </table>
  <br>
  <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
   <tr>
      <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
     </tr>     
<%
 if (teamSmallNameList != null) { 
  Iterator<TeamSmall> teamSmallNameIter = teamSmallNameList.iterator();
  while ( teamSmallNameIter.hasNext() ) {
   TeamSmall teamSmallName = (TeamSmall)teamSmallNameIter.next();
%>    
   <tr>
    <td width="190" align="center" bgcolor="ffffff" height="20">
      <a href="<c:url value='/team/myTeamDetail'>
        <c:param name='Teamname' value='<%=teamSmallName.getName()%>'/>
        </c:url>"> <%=teamSmallName.getName()%></a>
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

<table style="width:100%">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr><td width="20"></td>
   <td>
   <table style="margin-left:auto; margin-right:auto;">
    <tr>
    <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>멘토링 팀 멘토 활동 내역</b>&nbsp;&nbsp;</td>
  </tr>
   </table>  
   <br>    
   <table style="background-color: YellowGreen; margin-left:auto; margin-right:auto;">
  <tr>
    <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>  
  </tr>
<%
 if (teamSmallNameMentorList != null) {
  Iterator<TeamSmall> teamSmallNameMentorIter = teamSmallNameMentorList.iterator();
  while ( teamSmallNameMentorIter.hasNext() ) {
   TeamSmall teamSmallNameMentor = (TeamSmall)teamSmallNameMentorIter.next();
%>    
  <tr>
   <td width="190" align="center" bgcolor="ffffff" height="20">
     <a href="<c:url value='/team/myTeamDetail'>
        <c:param name='Teamname' value='<%=teamSmallNameMentor.getName()%>'/>
       </c:url>"><%=teamSmallNameMentor.getName()%></a> 
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
<table style="width:100%">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
   <td width="20"></td>
   <td>
     <table style="margin-left:auto; margin-right:auto;">
      <tr>
        <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>멘티 승인 대기 팀 목록</b>&nbsp;&nbsp;</td>
      </tr>
     </table>  
     <br>        
     
     <table style="background-color: YellowGreen;margin-left:auto; margin-right:auto;">
      <tr>
        <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>

        
      </tr>
<%  
   if (waitingList != null) {   
     Iterator<Waiting> waitingIter = waitingList.iterator();

     while ( waitingIter.hasNext() ) {
        Waiting waiting = (Waiting)waitingIter.next();
%>        
      <tr>
        
        <td width="190" align="center" bgcolor="ffffff" height="20">
           <a href="<c:url value='/team/teamSmallDetail'>
                  <c:param name='Teamname' value='<%=waiting.getTeamSmall().getName()%>'/>
                 </c:url>">
         <%=waiting.getTeamSmall().getName()%></a> 
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

 <table style="width:100%">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
   <td width="20"></td>
   <td>
     <table style="margin-left:auto; margin-right:auto;">
      <tr>
        <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>특강 참여 내역</b>&nbsp;&nbsp;</td>
      </tr>
     </table>  
     <br>        
     
     <table style="background-color: YellowGreen;margin-left:auto; margin-right:auto;">
      <tr>
        <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>

        
      </tr>
<%  
   if (teamLargeList != null) {   
     Iterator<TeamLarge> TeamLargeIter = teamLargeList.iterator();

     while ( TeamLargeIter.hasNext() ) {
        TeamLarge teamLarge = (TeamLarge)TeamLargeIter.next();
%>        
      <tr>
        
        <td width="190" align="center" bgcolor="ffffff" height="20">
           <a href="<c:url value='/teamLarge/teamLargeDetail'>
                  <c:param name='Teamname' value='<%=teamLarge.getName()%>'/>
                 </c:url>">
         <%=teamLarge.getName()%></a> 
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
 <table style="width:100%">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
   <td width="20"></td>
   <td>
     <table style="margin-left:auto; margin-right:auto;">
      <tr>
        <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>특강 멘토 활동 내역</b>&nbsp;&nbsp;</td>
      </tr>
     </table>  
     <br>        
     
     <table style="background-color: YellowGreen;margin-left:auto; margin-right:auto;">
      <tr>
        <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>

        
      </tr>
<%  
   if (teamLargeMentorList != null) {   
     Iterator<TeamLarge> teamLargeMentorListIter = teamLargeMentorList.iterator();

     while ( teamLargeMentorListIter.hasNext() ) {
        TeamLarge teamLargeMentor = (TeamLarge)teamLargeMentorListIter.next();
%>        
      <tr>
        
        <td width="190" align="center" bgcolor="ffffff" height="20">
           <a href="<c:url value='/teamLarge/teamLargeDetail'>
                  <c:param name='Teamname' value='<%=teamLargeMentor.getName()%>'/>
                 </c:url>">
         <%=teamLargeMentor.getName()%></a> 
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
<div style="text-align: center;">
<input type="button" value="돌아가기" onClick="javascript:back()">
</div>
</body>
</html> 
