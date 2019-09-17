<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 @SuppressWarnings("unchecked") 
 List<Mentor> mentorRecommendList1 = (List<Mentor>)request.getAttribute("mentorRecommendList1");
 List<Mentor> mentorRecommendList2 = (List<Mentor>)request.getAttribute("mentorRecommendList2");
 List<Mentor> mentorRecommendList3 = (List<Mentor>)request.getAttribute("mentorRecommendList3");
   Member member = (Member)request.getAttribute("member");
   String curUserId = (String)request.getAttribute("curUserId");
   String isMentor = (String)request.getAttribute("isMentor");
   String isNotMentor = (String)request.getAttribute("isNotMentor");
 List<String> fieldNameList = (List<String>)request.getAttribute("fieldNameList"); 
%>

<html>
<head>
<meta charset="utf-8">
<link rel=stylesheet href="<c:url value='/css/menu.css' />" type="text/css">
<title>메인페이지</title>
<style>
</style>
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
<body>

<br><br>
<div class="menubar" style="text-align:center">
 <ul>
  <li><a href="#" id="current">Team</a>
          <ul>
             <li><a href="<c:url value='/team/teamSmallList' />">팀 리스트 보기</a></li>
             
             <% 
            if (isNotMentor.equals("true")) { %>
           <li><a href="<c:url value='/team/teamSmalljoin/form' />">팀 개설하기</a></li>  
          <% } %>
             
             
             <li><a href="<c:url value='/teamLarge/teamLargeList' />">특강 리스트 보기</a></li>
            
             
             <% 
            if (isNotMentor.equals("true")) { %>
           <li><a href="<c:url value='/teamLarge/teamLargeJoin/form' />">특강 개설하기</a></li>
          <% } %>
          </ul>
  </li>
  
 			
  
  
  
  
  
  <li><a href="#">Mentor</a>
   <ul>
             <li><a href="<c:url value='/mentor/mentorList' />">멘토 목록 보기</a></li>
            
             <% 
            if (isMentor.equals("false")) { %>
           <li><a href="<c:url value='/mentor/mentorJoin/form' />">멘토 등록하기</a></li>
          <% } %>
          </ul>
      </li>
  <li><a href="<c:url value='/rent/rentPlacePageList'><c:param name='curUserId' value='<%=curUserId%>'/></c:url>">장소대여 신청</a></li>
  <li><a href="<c:url value='/review/reviewList'><c:param name='curUserId' value='<%=curUserId%>'/></c:url>">후기게시판</a></li>
 </ul>
</div>
 <br>
<table style="margin-left: auto; margin-right: auto;">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
 <td></td>
 <td>
   <table style="margin-left: auto; margin-right: auto;">
   <tr><td><br></td></tr>
   <tr><td><br></td></tr>
   <tr><td><br></td></tr>
   <tr><td><br></td></tr>
   <tr><td><br></td></tr>
   <tr><td><br></td></tr>
   <tr><td><br></td></tr>
   <tr><td><br></td></tr>
  <tr>
    <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>관심분야 멘토추천</b>&nbsp;&nbsp;</td>
  </tr>
   </table>  
     
   <% if (fieldNameList.get(0) != null) %>
   <br>    
   필드이름:<%=fieldNameList.get(0) %><br><br>
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
   <%=mentor.getMember().getName()%> (<%=mentor.getMember().getId()%>)
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
   
      <% if (fieldNameList.get(1) != null) %>
   <br>    
   필드이름:<%=fieldNameList.get(1) %><br><br>
   <table style="background-color: YellowGreen">
  <tr>
    <td width="190" align="center" bgcolor="E6ECDE" height="22">멘토이름 (ID)</td>
    <td width="200" align="center" bgcolor="E6ECDE">별점</td>
    <td width="200" align="center" bgcolor="E6ECDE">멘토 활동경험 횟수</td> 
  </tr>
<%  
 if (mentorRecommendList2 != null) { 
   Iterator<Mentor> MentorIter = mentorRecommendList2.iterator();

   while ( MentorIter.hasNext() ) {
    Mentor mentor = (Mentor)MentorIter.next();
%>    
  <tr>  
    <td width="190" align="center" bgcolor="ffffff" height="20">
   <%=mentor.getMember().getName()%> (<%=mentor.getMember().getId()%>)
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
   
      <% if (fieldNameList.get(2) != null) %>
   <br>    
   필드이름:<%=fieldNameList.get(2) %><br><br>
   <table style="background-color: YellowGreen">
  <tr>
    <td width="190" align="center" bgcolor="E6ECDE" height="22">멘토이름 (ID)</td>
    <td width="200" align="center" bgcolor="E6ECDE">별점</td>
    <td width="200" align="center" bgcolor="E6ECDE">멘토 활동경험 횟수</td> 
  </tr>
<%  
 if (mentorRecommendList3 != null) { 
   Iterator<Mentor> MentorIter = mentorRecommendList3.iterator();

   while ( MentorIter.hasNext() ) {
    Mentor mentor = (Mentor)MentorIter.next();
%>    
  <tr>  
    <td width="190" align="center" bgcolor="ffffff" height="20">
   <%=mentor.getMember().getName()%> (<%=mentor.getMember().getId()%>)
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
 
</body>
</html> 