<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked") 
   List<TeamSmall> teamSmallNameMentorList = (List<TeamSmall>)request.getAttribute("teamSmallNameMentorList");
   String curUserId = (String)request.getAttribute("curUserId");
   Location location = (Location)request.getAttribute("location");
   
   
%>
<html>
<head>
<title>장소대여 신청</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>

function rentCreate() {
   
   form.submit();
}

function back()
{ 
   history.go(-1);
}

function rentList(targetUri) {
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
          <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;&nbsp;&nbsp;</a>
   </div>
</h3>  
<div style="text-align:center">    
   <a href="<c:url value='/main/mainpage' />">
   <img src="<c:url value='/images/logo.png' />" /></a>   
</div> 
<div style="text-align:right">
<h3>대여 장소 지점 이름 : <%=location.getLocname()%> <%=location.getLocnum()%>호점</h3>  
(멘토만 장소를 대여할 수 있습니다.) 
</div>  
<body bgcolor=#F5FFFA text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form  -->
<form name="form" method="POST" action="<c:url value='/rent/rentPlaceRequest' />">
<table style="margin-left: auto; margin-right: auto;">
    <tr>
         <td width="20"></td>
        <td>
             <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
              <tr>
                   <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>팀 개설</b>&nbsp;&nbsp;</td>
              </tr>
             </table><br>     
             <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
                <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">대여 장소 지점 이름</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <%=location.getCity()%> <%=location.getLocname()%> <%=location.getLocnum()%>호점 
                  </td>
              </tr> 
              <tr height="40">
               <td width="150" align="center" bgcolor="F0FFF0">빌리려는 장소 넘버</td>
               <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                  <select id="fieldSelect1" name="roomnum1">
                        <option value="" selected >---선택---</option>
                        <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>   
                  </td>
              </tr>    
               <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">장소 대여 등록할 팀</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <select id="fieldSelect1" name="teamname">
                        <option value="" selected >---선택---</option>
                           <%
                                for(int i = 0; i < teamSmallNameMentorList.size(); i++){%>
                                   <option value="<%=teamSmallNameMentorList.get(i).getName()%>" 
                                  ><%=teamSmallNameMentorList.get(i).getName()%></option>   
                             <%}%>
                     </select>   
               </td>
    		</tr>   
              <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">날짜 입력</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <input value="YYYY/MM/DD" onfocus="setFocus(this)" onblur="setBlur(this)" type="text"
			         		style="width: 240" name="rdate">
                 </td>
              </tr> 
              <tr height="40">
                  <td width="150" align="center" bgcolor="F0FFF0">시간 입력</td>
                  <td width="250" bgcolor="F5FFFA" style="padding-left: 10">
                     <select id="fieldSelect1" name="rtime">
                        <option value="" selected >---선택---</option>
                           <option value="09:00">09:00</option>
                           <option value="10:00">10:00</option>
                           <option value="11:00">11:00</option>
                           <option value="12:00">12:00</option>
                           <option value="13:00">13:00</option>
                           <option value="14:00">14:00</option>
                           <option value="15:00">15:00</option>
                           <option value="16:00">16:00</option>
                           <option value="17:00">17:00</option>
                  </select>   
               </td>
              </tr>  
             </table><br>     
             <table style="margin-left: auto; margin-right: auto;">
              <tr>
                  <td align="left">
                     <input type="button" value="장소대여 신청" onClick="rentCreate()"> &nbsp;
                     <input type="button" value="목록" onClick="rentList('<c:url value='/rent/rentPlacePageList' />')"> &nbsp;
                     <input type="button" value="취소" onClick="javascript:back()">
                  </td>
            </tr>
             </table>
        </td>
    </tr>
</table>  
</form>

<!--  <input type="button" value="취소" onClick="javascript:back()"> -->

</body>
</html>