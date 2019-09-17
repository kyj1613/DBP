<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
@SuppressWarnings("unchecked")
   Review review = (Review)request.getAttribute("review");
	Mentor mentor = (Mentor)request.getAttribute("mentor");
   Review reviewStar = (Review)request.getAttribute("reviewStar");
   String curUserId = (String)request.getAttribute("curUserId");
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
       	<a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;&nbsp;&nbsp;</a>
	</div>
</h3>  
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
         <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>리뷰 상세정보 보기</b>&nbsp;&nbsp;</td>
        </tr>
       </table>  
       <br>            
        <table style="background-color: YellowGreen">
          
        <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">리뷰제목</td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
            <%=review.getRevtitle()%>
         </td>
        </tr>
        <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">리뷰작성자</td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
            <%=review.getMember().getId()%>
         </td>
        </tr>
        <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">리뷰에 대한 멘토 </td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
            <%=mentor.getMember().getName()%>
         </td>
        </tr>
        <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">리뷰내용</td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
            <%=review.getRevcontent()%>
         </td>
        </tr>        
             
        <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">리뷰날짜</td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
            <%=review.getRevdate()%>
         </td>
        </tr>   
        <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">별점</td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
            만족성: <%=reviewStar.getStar().getSatisfaction()%> 참여성: <%=reviewStar.getStar().getParticipation()%> 준비성: <%=reviewStar.getStar().getPreparation()%>
           
         </td>
        </tr>
        <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">총 별점</td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
          <%=reviewStar.getStar().getStarTotal()%>
           
         </td>
        </tr>
         <tr>
         <td width="120" align="center" bgcolor="E6ECDE" height="22">조회수</td>
         <td width="470" bgcolor="ffffff" style="padding-left: 10">
            <%=review.getCnt()%>
         </td>
        </tr>   
       </table><br>
 	 		<table style="margin-left: auto; margin-right: auto;">
	 			<tr>
	 				<td width="650">&nbsp;</td>
	 				<td width="200">
	 					<input type="button" value="이전 페이지로 가기" onClick="javascript:back()">
	 				</td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
</table>  
</body>
</html>