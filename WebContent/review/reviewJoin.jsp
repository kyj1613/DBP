<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String curUserId = (String)request.getAttribute("curUserId");
	List<Mentor> mentorList = (List<Mentor>)request.getAttribute("mentorList");
	List<Mentor> mentorLargeList = (List<Mentor>)request.getAttribute("mentorLargeList");
	List<TeamSmall> teamSmallTnameList = (List<TeamSmall>)request.getAttribute("teamSmallTnameList");
	List<TeamLarge> teamLargeTnameList = (List<TeamLarge>)request.getAttribute("teamLargeTnameList");
%>
<html>
<head>
<title>후기글 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>

function teamSmallCreate() {

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
	<a href="<c:url value='/mypage/mypage'><c:param name='curUserId' value='<%=curUserId%>'/></c:url>">
      <img src="<c:url value='/images/mypage_logo.png' />" width='50px' height='50px' /></a>
          : <%=curUserId%>
		 <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a></h3>
		 <div style="text-align:center">    
   <a href="<c:url value='/main/mainpage' />">
   <img src="<c:url value='/images/logo.png' />" /></a>   
</div>  
<body bgcolor=#F5FFFA text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form  -->
<form name="form" method="GET" action="<c:url value='/review/reviewJoin' />">
  <table style="width: 100%">
    <tr>
      <td width="20"></td>
     <td>
       <table>
        <tr>
          <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>후기글 작성</b>&nbsp;&nbsp;</td>
        </tr>
       </table>  
       
       <br>     
       <table style="background-color: YellowGreen">
       <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">제목</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <input type="text" style="width: 240" name="revtitle">
         </td>
        </tr> 
        <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">멘토id</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <select id="mentorSelect1" name="mentorid">
			            <option value="" selected >---선택---</option>
			            <%
	           for(int i = 0; i < teamSmallTnameList.size(); i++){%>
	              <option value="<%=mentorList.get(i).getMember().getId()%>">
	              <%=teamSmallTnameList.get(i).getName()%>팀의 멘토<%=mentorList.get(i).getMember().getName()%>
	             </option> 
	             
	           <%}%>
	           <%
	           for(int i = 0; i < teamLargeTnameList.size(); i++){%>
	              <option value="<%=mentorLargeList.get(i).getMember().getId()%>">
	              <%=teamLargeTnameList.get(i).getName()%>팀의 멘토<%=mentorLargeList.get(i).getMember().getName()%>
	             </option>   
	           <%}%>
			            </select>	
         </td>
        </tr>  
        
        <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">후기 내용</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <input type="text" style="width: 240" name="revcontent">
         </td>
        </tr>   
        <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">후기 날짜</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <input value="YYYY/MM/DD" onfocus="setFocus(this)" onblur="setBlur(this)" type="text"
			         		style="width: 240" name="revdate">
         </td>
        </tr>
        <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">만족성</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <select id="starSelect1" name="SATISFACTION">
            <option value="" selected >---선택---</option>
			            <option value="1">★☆☆☆☆</option>
			            <option value="2">★★☆☆☆</option>
			            <option value="3">★★★☆☆</option>
			            <option value="4">★★★★☆</option>
			            <option value="5">★★★★★</option>
			            </select>	
         </td>
        </tr>
        <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">참여성</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <select id="starSelect1" name="PARTICIPATION">
            <option value="" selected >---선택---</option>
			            <option value="1">★☆☆☆☆</option>
			            <option value="2">★★☆☆☆</option>
			            <option value="3">★★★☆☆</option>
			            <option value="4">★★★★☆</option>
			            <option value="5">★★★★★</option>
			            </select>	
         </td>
        </tr>
        <tr height="40">
         <td width="150" align="center" bgcolor="F0FFF0">준비성</td>
         <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
            <select id="starSelect1" name="PREPARATION">
            <option value="" selected >---선택---</option>
			            <option value="1">★☆☆☆☆</option>
			            <option value="2">★★☆☆☆</option>
			            <option value="3">★★★☆☆</option>
			            <option value="4">★★★★☆</option>
			            <option value="5">★★★★★</option>
			            </select>	
         </td>
        </tr>
        
       </table>
       <br>     
       <table style="width: 100%">
        <tr>
         <td align="left">
         <input type="button" value="리뷰 등록" onClick="teamSmallCreate()"> &nbsp;
         <input type="button" value="목록" onClick="teamList('<c:url value='/team/teamSmallList' />')">
         </td>
        </tr>
       </table>
     </td>
    </tr>
  </table>  
</form>

 <input type="button" value="이전 페이지로 돌아가기" onClick="javascript:back()">

</body>
</html>