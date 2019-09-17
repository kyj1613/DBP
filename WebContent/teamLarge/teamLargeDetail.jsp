<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   TeamLarge teamLarge = (TeamLarge)request.getAttribute("teamLarge");
   Mentor mentor = (Mentor)request.getAttribute("mentor");
   String curUserId = (String)request.getAttribute("curUserId");
   String Teamname = (String)request.getAttribute("Teamname");
   String teamfield = (String)request.getAttribute("teamfield");
   int counting = (int) request.getAttribute("counting");
   String isWaiting = (String)request.getAttribute("isWaiting");
   String isMentor = (String)request.getAttribute("isMentor");
%>
<html>
<head>
<title>특강 정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>

function mentorRequest() {
   
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
<form name="form" method="POST" action="<c:url value='/teamLarge/teamLargeAttend' />"> 
<table style="margin-left: auto; margin-right: auto;">
     <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
     <tr>
         <td width="20"></td>
         <td>
           <table style="margin-left: auto; margin-right: auto;">
              <tr>
                 <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=Teamname%>팀 상세정보</b>&nbsp;&nbsp;</td>
            </tr>
         </table><br>        
           <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
              <tr>
                 <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
                 <td width="190" align="center" bgcolor="ffffff" height="20">
                  <%=teamLarge.getName()%>     
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
                   <%=teamfield%>     
                 </td>
            </tr>
            <tr>
               <td width="200" align="center" bgcolor="E6ECDE">만나는위치</td>
               <td width="200" align="center" bgcolor="ffffff" height="20">
                  <%=teamLarge.getMeetingLoc()%>     
                 </td>
            </tr>
            <tr>
              <td width="200" align="center" bgcolor="E6ECDE">현재인원/ 제한인원</td>
               <td width="200" align="center" bgcolor="ffffff" height="20">
                  <%=counting%>/ <%=teamLarge.getLimit() %>
                 </td> 
            </tr>
         </table><br>
            <% if(isWaiting.equals("false") && isMentor.equals("false") && (counting != teamLarge.getLimit())) { %> 
                <table style="margin-left: auto; margin-right: auto;">
                  <tr><td width="650">&nbsp;</td>
                         <td width="200" style="align: right;">
                            <input type="submit" value="특강 신청하기" >
                       </td>
                  </tr>
               </table><br>
            <% } %>
            <table style="margin-left: auto; margin-right: auto;">
                 <tr>
                  <td> 
                        <input type="button" value="이전 페이지로 돌아가기" onClick="javascript:back()">&nbsp;&nbsp;
                  </td>
                 </tr>
             </table>
      </td>
     </tr>
</table>
</body>
</html> 
