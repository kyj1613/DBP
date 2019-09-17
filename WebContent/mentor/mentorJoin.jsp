<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Mentor" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked") 
   List<Mentor> mentorList = (List<Mentor>)request.getAttribute("mentorList");
   String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>멘토 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function mentorCreate() {
   
   if (form.profile.value == "") {
      alert("자기소개를 입력하십시오.");
      form.profile.focus();
      return false;
   }   
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
<form name="form" method="POST" action="<c:url value='/mentor/mentorJoin' />">
<table style="margin-left: auto; margin-right: auto;">
    <tr>
         <td width="20"></td>
        <td>
          <table>
            <tr>
                <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>멘토 등록</b>&nbsp;&nbsp;</td>
              </tr>
          </table><br>    
       <!-- 멘토등록이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
           <c:if test="${registerFailed}">
               <font color="red"><c:out value="${exception.getMessage()}" /></font>
          </c:if><br>     
          <table style="background-color: YellowGreen">
              <tr height="40">
               <td width="150" align="center" bgcolor="F0FFF0">활동분야</td>
               <td width="450" bgcolor="F5FFFA" style="padding-left: 10">
                  <input type="radio" name="checkfield" value="1"> IT &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="checkfield" value="2"> 수학 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="checkfield" value="3"> 기계 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="checkfield" value="4"> 어문 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="checkfield" value="5"> 마케팅 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                  <input type="radio" name="checkfield" value="6"> 디자인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="checkfield" value="7"> 미디어 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </td>
              </tr>
              <tr height="40">
               <td width="150" align="center" bgcolor="F0FFF0">자기소개</td>
               <td width="450" bgcolor="F5FFFA" style="padding-left: 10">
                  <!-- <input type="text" size="65" name="profile"  -->
                  <textarea name="profile" cols="50" rows="10" wrap="hard">
                  <c:if test="${registerFailed}">value="${mentor.profile}"</c:if></textarea>
               </td>
            </tr>   
         </table><br>     
         <table style="margin-left: auto; margin-right: auto;">
            <tr>
               <td align="left">
                  <input type="button" value="등록" onClick="mentorCreate()"> &nbsp;
                  <input type="button" value="멘토 목록 보기" onClick="mentorList('<c:url value='/mentor/mentorList' />')">
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>  
</form>
</body>
</html>