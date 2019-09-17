<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked")
   String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>특강 개설</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function mentorCreate() {
   
   
   form.submit();
}

function back()
{ 
   history.go(-1);
}
function mentorList(targetUri) {
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
<form name="form" method="POST" action="<c:url value='/teamLarge/teamLargeJoin' />">
   <table style="margin-left: auto; margin-right: auto;">   
       <tr>
          <td width="20"></td>
           <td>
             <table>
                 <tr>
                   <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>특강 개설</b>&nbsp;&nbsp;</td>
               </tr>
             </table><br>    
               <c:if test="${registerFailed}">
                  <font color="red"><c:out value="${exception.getMessage()}" /></font>
             </c:if><br>     
             <table style="background-color: YellowGreen">
                   <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">팀이름</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <input type="text" style="width: 240" name="tname">   
                  </td>
                 </tr>   
               <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">시작날짜</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <input value="YYYY/MM/DD" onfocus="setFocus(this)" onblur="setBlur(this)" type="text"
			         		style="width: 240" name="start_date">      
                  </td>
               </tr>
                 <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">활동분야</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <select id="fieldSelect1" name="field1">
                              <option value="" selected >---선택---</option>
                              <option value="1">IT</option>
                              <option value="2">수학</option>
                              <option value="3">기계</option>
                              <option value="4">어문</option>
                              <option value="5">마케팅</option>
                              <option value="6">디자인</option>
                              <option value="7">미디어</option>
                     </select>
                  </td>
                 </tr>
                 <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">만나는위치</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <input type="text" style="width: 240" name="meeting_loc">
                  </td>
               </tr>   
                 <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">제한수</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <input type="text" style="width: 240" name="limit">         
                  </td>
               </tr>   
             </table><br>     
             <table style="margin-left: auto; margin-right: auto;">
                 <tr>
                  <td align="left">
                  <input type="button" value="특강 등록" onClick="mentorCreate()"> &nbsp;
                  <input type="button" value="특강 목록보기" onClick="mentorList('<c:url value='/teamLarge/teamLargeList' />')">
                  </td>
                 </tr>
             </table>
           </td>
       </tr>
     </table>  
</form>
</body>
</html> 
