<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function userCreate() {
	if (form.id.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	
	if (form.pwd.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}
	if (form.pwd.value != form.pwd2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password2.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	
	if(form.email.value == "") {
		alert("이메일을 입력하십시오.");
		form.email.focus();
		return false;
	}	

	if(form.tel.value == "") {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.tel.focus();
		return false;
	}
	if(form.nickname.value == "") {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.nickname.focus();
		return false;
	}
	if(form.birth.value == "") {
		alert("생일 형식이 올바르지 않습니다..");
		form.phone.focus();
		return false;
	}
	if (form.field1.value == form.field2.value || form.field2.value == form.field3.value || form.field1.value == form.field3.value) {
		alert("중복된 데이터 전송 불가");
		form.field1.focus();
		return false;
	}
	if (form.field2.value == form.field3.value) {
		alert("중복된 데이터 전송 불가");
		form.field2.focus();
		return false;
	}
	if (form.field1.value == form.field3.value) {
		alert("중복된 데이터 전송 불가");
		form.field3.focus();
		return false;
	}
	
	form.submit();
}

function back()
{ 
	history.go(-1);
}
function userList(targetUri) {
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
<body bgcolor=#F5FFFA text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form  -->
<form name="form" method="POST" action="<c:url value='/member/register' />">
<table style="margin-left: auto; margin-right: auto;">
    <tr>
      	<td width="20"></td>
	  	<td>
	    	<table style="margin-left: auto; margin-right: auto;">
		  		<tr>
		    		<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원 가입</b>&nbsp;&nbsp;</td>
		  		</tr>
	    	</table><br>	 
        	<c:if test="${registerFailed}">
	      		<font color="red"><c:out value="${exception.getMessage()}" /></font>
	    	</c:if>
	   		<br>	  
	   		<table style="background-color: YellowGreen">
	  	  		<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">사용자 ID</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="text" style="width: 240;" name="id"> 
					</td>
		  		</tr>
	  	  		<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">비밀번호</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="password" style="width: 240" name="pwd">
					</td>
		  		</tr>
			  	<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">비밀번호 확인</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="password" style="width: 240" name="pwd2">
					</td>
				</tr>
		  	  	<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">이름</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="text" style="width: 240" name="name" >
							<c:if test="${registerFailed}">value="${member.name}"</c:if>
					</td>
			  	</tr>	
		  	  	<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">전화번호</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="text" style="width: 240" name="tel" >
					</td>
			  	</tr>
		  		<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">성별</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="radio" name="sex" value="man"> 남 &nbsp; &nbsp; &nbsp; &nbsp;
						<input type="radio" name="sex" value="woman"> 여
							
					</td>
		  		</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">닉네임</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="text" style="width: 240" name="nickname" >
					</td>
		 		</tr>
		  		<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">생년월일</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input value="YYMMDD" onfocus="setFocus(this)" onblur="setBlur(this)" type="text"
			         		style="width: 240" name="birth">
					</td>
				</tr>	
		  		<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">이메일</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<input type="text" style="width: 240" name="email" >
					</td>
			  	</tr>		
				<tr height="40">
					<td width="150" align="center" bgcolor="F0FFF0">관심분야1</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<c:if test="${registerFailed}">value="${member.field1}"</c:if>
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
					<td width="150" align="center" bgcolor="F0FFF0">관심분야2</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<c:if test="${registerFailed}">value="${member.field2}"</c:if>
							<select id="fieldSelect1" name="field2">
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
					<td width="150" align="center" bgcolor="F0FFF0">관심분야3</td>
					<td width="250" bgcolor="F5FFFA" style="padding-left: 10">
						<c:if test="${registerFailed}">value="${member.field3}"</c:if>
						<select id="fieldSelect1" name="field3">
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
	    	</table><br>	   
	    	<table style="margin-left: auto; margin-right: auto;">
		  		<tr>
					<td align="left">
						<input type="button" value="회원 가입" onClick="userCreate()"> &nbsp;
						<input type="button" value="취소" onClick="javascript:back()">
					</td>
		  		</tr>
	    	</table>
	  	</td>
	</tr>
</table>  
</form>
</body>
</html>