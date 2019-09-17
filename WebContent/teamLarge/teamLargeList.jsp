<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.TeamLarge" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked") 
   List<TeamLarge> teamLargeList = (List<TeamLarge>)request.getAttribute("teamLargeList"); 
   String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>특강 목록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/team.css' />" type="text/css">
<style>
/* 비동기적으로 생성될 테이블들에 대한 스타일 정의 */
.rtable {
  background: YellowGreen;
}
.teamHead {
  width: 200px;
  height: 22px;
  text-align: center;
  background-color: E6ECDE;  
}
.teamCell {
  width: 200px;
  height: 20px;
  text-align: center;
  background-color: FFFFFF;  
}
</style>
<script src="<c:url value='/js/jquery-1.12.4.min.js'/>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {   
    $('input:radio[name=tlStatus]').click(function()  {       
   // commId 클래스가 지정된 <a> 링크에 대한 이벤트 핸들러
      $.ajax({            // 비동기적인 AJAX request 발생 및 결과 처리
         type: "GET",
         url: "<c:url value='/teamLarge/teamLargeView/json'/>"+"?tlStatus="+$('input:radio[name=tlStatus]:checked').val(),
         cache: false,
         dataType: "json",   // 결과는 JSON 형식의 data (Console에 출력되는 log 참조)
         success:  function(teamLargeList) {  // 요청에 대한 응답 수신 시 호출되는 callback function                   // community는 JSON data로부터 생성된 JS 객체                  
            /* 커뮤니티 상세 정보 테이블 생성 */
            $("#teamList").empty(); // commDetail이라는 id를 갖는 엘리먼트의 모든 자식들을 삭제
            var radioVal = $('input[name="tlStatus"]:checked').val();
            if (radioVal == 'avail') 
               $("#teamList").append("모집중인 팀:");   // commDetail 엘리먼트에 텍스트 자식 추가
            else
               $("#teamList").append("모집 완료된 팀:");   // commDetail 엘리먼트에 텍스트 자식 추가
               $("#teamList").append(document.createElement("table"));   // <table> 엘리먼트 추가
               $("#teamList table").addClass("rtable");
               $("#teamList table").append("<tr><td>팀 이름</td><td>활동 분야</td><td>만나는 위치</td></tr>");
               $("#teamList table tr td").addClass("teamHead");
               $.each(teamLargeList , function(i, item) {   
                  $("#teamList table").append(
                     "<tr><td>" + item.name + "</td>"
                     + "<td>" + item.field.fname + "</td>"
                     + "<td>" + item.meetingLoc + "</td></tr>");
                  $("#teamList table tr:last-child td").addClass("teamCell"); 
            });   
         }
      });
   });
});
</script>
</head>
<script>
function back()
{ 
   history.go(-1);
}
function mentorList(targetUri) {
   form.action = targetUri;
   form.submit();
}
</script>
<h3>
<div style="text-align:right">         
      <a href="<c:url value='/mypage/mypage'><c:param name='curUserId' value='<%=curUserId%>'/></c:url>">
      <img src="<c:url value='/images/mypage_logo.png' />" width='50px' height='50px' /></a>
          : <%=curUserId%>
         <a href="<c:url value='/member/logout' />">(로그아웃)&nbsp;&nbsp;</a></h3></div> 
         <div style="text-align:center">    
      <a href="<c:url value='/main/mainpage' />">
      <img src="<c:url value='/images/logo.png' />" /></a>   
   </div>  
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table style="margin-left: auto; margin-right: auto;">
   <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
   <tr>
      <td width="20"></td>
      <td>
           <table>
            <tr>
                 <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>팀 리스트</b>&nbsp;&nbsp;</td>
            </tr>
            <tr>
                 <td>
                    <input type="radio" name="tlStatus" id="aaa" value="avail" >모집중인 팀
                    <input type="radio" name="tlStatus" id="bbb" value="unavail">모집 완료된 팀
                 </td>
               </tr>
           </table><br> 
           <div id="teamList"></div>
           <br>전체 팀 리스트 :
         <div id="a">  
         <table style="background-color: YellowGreen">
            <tr>
              <td width="190" align="center" bgcolor="E6ECDE" height="22">팀이름</td>
              <td width="200" align="center" bgcolor="E6ECDE">활동분야</td>
              <td width="200" align="center" bgcolor="E6ECDE">만나는위치</td>
            </tr>
            <%  
               if (teamLargeList != null) {   
                  Iterator<TeamLarge> teamLargeIter = teamLargeList.iterator();
            
                  while ( teamLargeIter.hasNext() ) {
                     TeamLarge teamLarge = (TeamLarge)teamLargeIter.next();
            %>        
         <tr>
            <td width="190" align="center" bgcolor="ffffff" height="20">
                 <a href="<c:url value='/teamLarge/teamLargeDetail'>
                     <c:param name='Teamname' value='<%=teamLarge.getName()%>'/></c:url>">
               <%=teamLarge.getName()%></a> 
              </td>
            <td width="200" align="center" bgcolor="ffffff" height="20"><%=teamLarge.getField().getFname()%></td>
            <td width="200" align="center" bgcolor="ffffff" height="20"><%=teamLarge.getMeetingLoc()%></td>
         </tr>
         <%
               }
            }
         %>        
           </table></div><br>   
      </td>
     </tr>
</table>
</body>
</html> 