<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>로그인 페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css'/>" type="text/css">
<script>
function login() {
   if (form.userId.value == "") {
      alert("사용자 ID를 입력하십시오.");
      form.userId.focus();
      return false;
   } 
   if (form.password.value == "") {
      alert("비밀번호를 입력하십시오.");
      form.password.focus();
      return false;
   }      
   form.submit();
}

function userCreate(targetUri) {
   form.action = targetUri;
   form.submit();
}

</script>
</head>
<body>
<div style="text-align:center">    
      <a href="<c:url value='/member/login/form' />">
      <img src="<c:url value='/images/logo.png' />" /></a><br>
   <b><로그인></b>
</div>      

<!-- login form  -->
<form name="form" method="POST" action="<c:url value='/member/login' />">   
   <!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
    <c:if test="${loginFailed}">
       <br><font color="red"><c:out value="${exception.getMessage()}" /></font><br>
   </c:if>
   <br>
   <table style="background-color: YellowGreen" align="center">
      <tr height="40">
         <td width="150" align="center" bgcolor="E6ECDE">사용자ID</td>
         <td width="250" bgcolor="ffffff" style="padding-left:10">
            <input type="text" style="width:240" name="userId">
         </td>
      </tr>
      <tr height="40">
         <td width="150" align="center" bgcolor="E6ECDE">비밀번호</td>
         <td width="250" bgcolor="ffffff" style="padding-left:10">
            <input type="password" style="width:240" name="password">
         </td>
      </tr>
   </table>
   <br>
   <table style="width:100%">
      <tr>
         <td align="center">
            <input type="button" value="로그인" onClick="login()"> &nbsp;&nbsp;&nbsp;
            <input type="button" value="회원가입" onClick="userCreate('<c:url value='/member/register/form'/>')">
         </td>
      </tr>
   </table>

</form>
</body>
</html>