 <%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<Mentor> mentor = (List<Mentor>)request.getAttribute("mentor");
	String curUserId = (String)request.getAttribute("curUserId");
	List<Mentor> mentorList = (List<Mentor>)request.getAttribute("mentorList");
%>

<html>
<head>
<title>멘토 목록 검색</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/team.css' />" type="text/css">
<style>
/* 비동기적으로 생성될 테이블들에 대한 스타일 정의 */
.rtable {
  background: YellowGreen;
}
.mentorHead {
  width: 200px;
  height: 22px;
  text-align: center;
  background-color: E6ECDE;  
}
.mentorCell {
  width: 200px;
  height: 20px;
  text-align: center;
  background-color: FFFFFF;  
}
</style>
<script src="<c:url value='/js/jquery-1.12.4.min.js'/>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {	
 	$('input:radio[name=checkfield]').click(function()  {       
	// commId 클래스가 지정된 <a> 링크에 대한 이벤트 핸들러
		$.ajax({				// 비동기적인 AJAX request 발생 및 결과 처리
			type: "GET",
			url: "<c:url value='/mentor/mentorListView/json'/>"+"?checkfield="+$('input:radio[name=checkfield]:checked').val(),
			cache: false,
			dataType: "json",	// 결과는 JSON 형식의 data (Console에 출력되는 log 참조)
			success:  function(mentorSearchList) {  // 요청에 대한 응답 수신 시 호출되는 callback function						 // community는 JSON data로부터 생성된 JS 객체						
				/* 커뮤니티 상세 정보 테이블 생성 */
				$("#mentorList").empty(); // commDetail이라는 id를 갖는 엘리먼트의 모든 자식들을 삭제
				$("#mentorList").append(document.createElement("table"));	// <table> 엘리먼트 추가
				$("#mentorList table").addClass("rtable");
				$("#mentorList table").append("<tr><td>멘토 이름</td><td>아이디</td><td>별점</td></tr>");
				$("#mentorList table tr td").addClass("mentorHead");
				$.each(mentorSearchList , function(i, item) {	
					$("#mentorList table").append(
						"<tr><td>" + item.member.name + "</td>"
						+ "<td>" + item.member.id + "</td>"
						+ "<td>" + item.star + "</td></tr>");
					$("#mentorList table tr:last-child td").addClass("mentorCell"); 
				});	
			}
		});
	});
});
</script>
<script>
function mentorCreate() {
	
	 
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
function mentorJoin(targetUri) {
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
		 <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a></h3> </div>
<div style="text-align:center">    
   <a href="<c:url value='/main/mainpage' />">
   <img src="<c:url value='/images/logo.png' />" /></a>   
</div>   

<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
	<table style="margin-left: auto; margin-right: auto;">
    	<tr>
			<td width="20"></td>
			<td>
				<table>
					<tr>
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>멘토 목록 검색</b>&nbsp;&nbsp;</td>
		  			</tr>
	    		</table><br>	 
	  	  
	    		<table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
			 		<tr height="40">
						<td width="100" align="center" bgcolor="F0FFF0">활동분야</td>
						<td width="450" bgcolor="F5FFFA" style="padding-left: 10">
							<input type="radio" name="checkfield" value="1"> IT 
							<input type="radio" name="checkfield" value="2"> 수학
							<input type="radio" name="checkfield" value="3"> 기계
							<input type="radio" name="checkfield" value="4"> 어문
							<input type="radio" name="checkfield" value="5"> 마케팅
							<input type="radio" name="checkfield" value="6"> 디자인
							<input type="radio" name="checkfield" value="7"> 미디어
						</td>
					</tr>
				</table><br>
				<div id="mentorList"></div>	  
	  		</td>
    	</tr>
 	</table>  
	<table style="margin-left: auto; margin-right: auto;">
		<tr>
		  	<br><td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>* 전체 멘토 리스트 *</b>&nbsp;&nbsp;</td>
		</tr>
	</table><br>	  
	<table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
		<tr>
			<td width="200" align="center" bgcolor="E6ECDE" height="22">이름(ID)</td>
		  	<td width="200" align="center" bgcolor="E6ECDE">활동분야</td>
		</tr>
		<%
			if (mentorList != null) {	
			  Iterator<Mentor> mentorIter = mentorList.iterator();
			  while ( mentorIter.hasNext() ) {
				  Mentor mentoraa = (Mentor)mentorIter.next();
		%>		  	
		<tr>
			<td width="200" align="center" bgcolor="ffffff" style="padding-left: 10">
				<a href="<c:url value='/mentor/mentorDetail'>
					   	<c:param name='mid' value='<%=mentoraa.getMember().getId()%>'/>
			 		 	</c:url>">
			  				<%=mentoraa.getMember().getName()%> (<%=mentoraa.getMember().getId()%>)</a>
		  	</td>
		  	<td width="190" align="center" bgcolor="ffffff" height="20">
				<%=mentoraa.getField().getFname()%> 
		  	</td>
		</tr>
		<%
				}
			}
		%>	 
		<%-- <tr><td>&nbsp;</td>
			<td><input type="button" value="멘토 등록하기" onClick="mentorList('<c:url value="/mentor/mentorJoin/form" />')"></td>
		</tr> --%>	
	</table><br> 
	<form name="form" method="POST" action="<c:url value='/mentor/mentorJoin/form' />">
	 	<table style="margin-left: auto; margin-right: auto;">
			<tr><td width="400">&nbsp;</td>
				<td width="200" style="align: right;">
					<input type="submit" value="멘토 등록하기" >
				</td>
			</tr>
		</table> 
	</form>
</body>
</html>