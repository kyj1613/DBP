<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
      TeamSmall teamSmall = (TeamSmall)request.getAttribute("ts");
      Mentor mentor = (Mentor)request.getAttribute("mentor");
      @SuppressWarnings("unchecked") 
      List<Mentee> MenteeList = (List<Mentee>)request.getAttribute("MenteeList"); 
      String fieldname = (String)request.getAttribute("fieldname");
   String Teamname = (String)request.getAttribute("Teamname");
   String curUserId = (String)request.getAttribute("curUserId");
   @SuppressWarnings("unchecked") 
   List<Waiting> waitingList = (List<Waiting>)request.getAttribute("waitingList"); 
   String isWaiting = (String)request.getAttribute("isWaiting");
   String isMentee = (String)request.getAttribute("isMentee");
   String isMentor = (String)request.getAttribute("isMentor");
   String isFull = (String)request.getAttribute("isFull");
%>
<html>
<head>
<title>팀 상세정보</title>
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
<form name="form" method="POST" action="<c:url value='/team/teamSmallRequest' />">  
<table style="margin-left: auto; margin-right: auto;">
   <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
   <tr>
      <td width="20"></td>
         <td>
           <table style="margin-left: auto; margin-right: auto;">
               <tr>
               <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>* <%=Teamname%> 팀 상세정보 *</b>&nbsp;&nbsp;</td>
               </tr>
           </table><br>        
           <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
               <tr>
                 <td width="150" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
                 <td width="200" align="center" bgcolor="ffffff" height="20">
                     <%=teamSmall.getName()%>     
                 </td>
               </tr>
               <tr>
                 <td width="150" align="center" bgcolor="E6ECDE" height="22">멘토이름</td>
                 <td width="200" align="center" bgcolor="ffffff" height="20">
                      <%=mentor.getMember().getName()%>     
                 </td>
               </tr>
               <tr>
                 <td width="150" align="center" bgcolor="E6ECDE" height="22">활동분야</td>
                  <td width="200" align="center" bgcolor="ffffff" height="20">
                      <%=fieldname%>     
                   </td>
               </tr>
               <tr>
                 <td width="150" align="center" bgcolor="E6ECDE">만나는위치</td>
                  <td width="200" align="center" bgcolor="ffffff" height="20">
                     <%=teamSmall.getMeetingLoc()%>     
                 </td>
               </tr>               
               <tr>
                 <td width="150" align="center" bgcolor="E6ECDE">멘티</td>
                 <td width="200" align="center" bgcolor="ffffff" height="20">
                     <c:forEach var="mentee" items="${MenteeList}" varStatus="status">   
                        ${mentee.member.name }<c:if test="${!status.last}">,</c:if>
                     </c:forEach>
                  </td> 
               </tr>
         </table><br>
         <% 
            if (isWaiting.equals("false") && isMentee.equals("false") && isMentor.equals("false") && isFull.equals("false")) { %>
            <%-- <form name="form" method="POST" action="<c:url value='/team/teamSmallRequest' />">   --%>    
                <table style="margin-left: auto; margin-right: auto;">
                    <tr><td width="350">&nbsp;</td>
                       <td width="200" style="align: right;">
                          <input type="submit" value="가입 신청하기" >
                         </td>
                    </tr>
                   </table>
             <!-- </form> -->   
          <% } %>  
      </td>
     </tr>
</table>
</form>
<form name="form" method="POST" action="<c:url value='/team/teamSmallWaiting/forming' />">
   <table style="margin-left: auto; margin-right: auto;">
       <tr>
            <td width="20"></td>
           <td><br>
             <table style="margin-left: auto; margin-right: auto;">
                 <tr>
                   <td align="center" bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>- 팀 가입 승인 대기 -</b>&nbsp;&nbsp;</td>
               </tr>
             </table><br>     
             <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
               <tr>
                    <td width="190" align="center" bgcolor="E6ECDE" height="22">대기명단</td>
                </tr>
               <%
                  if (waitingList != null) {   
                    Iterator<Waiting> WaitingIter = waitingList.iterator();
                  
                  
                    while ( WaitingIter.hasNext() ) {
                       Waiting waiting = (Waiting)WaitingIter.next();
               %>           
               <tr>
                    <td width="200" bgcolor="ffffff" style="padding-left: 10">
                       <input type="checkbox" name="mname" value="<%=waiting.getMname()%>"/> 
                       <%=waiting.getMname()%>
                    </td>
                 </tr>
               <%
                       }
                  }
               %>        
              </table>   
              <br>
              <%    
                 /* if(mentor.getMember().getId().equals(curUserId)) { */if(isMentor.equals("true")) {
              %>
                 <table style="margin-left: auto; margin-right: auto;">
                    <tr><td width="220">&nbsp;</td>
                     <td width="100" style="align: right;">
                        <input type="submit" value="승인" onClick="mentorRequest()"> &nbsp;
                     </td>
                    </tr>
                </table>
              <%
                 } 
                 %>
                 <br>
                 <table style="margin-left: auto; margin-right: auto;">
                 <tr>
                  <td> 
                        <input type="button" value="팀 목록 보기" onClick="javascript:back()">&nbsp;&nbsp;
                  </td>
                 </tr>
             </table>
           </td>
       </tr>
     </table>  
</form>
</body>
</html> 
