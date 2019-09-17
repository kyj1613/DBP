 <%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked") 
   List<Location> DistinctLocationList = (List<Location>)request.getAttribute("DistinctLocationList"); 
   String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>지점 리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
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
     <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
     <tr>
      <td width="20"></td>
      <td>
           <table style="margin-left: auto; margin-right: auto;">
            <tr>
                 <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>장소 리스트</b>&nbsp;&nbsp;</td>
            </tr>
           </table><br>        
         <table style="background-color: YellowGreen; margin-left: auto; margin-right: auto;">
            <tr>
               <td width="200" align="center" bgcolor="E6ECDE">위치이름</td>
            </tr>
            <%  
               if ( DistinctLocationList != null) {   
                    Iterator<Location> LocationIter =  DistinctLocationList.iterator();
            
                    while ( LocationIter.hasNext() ) {
                       Location location = (Location)LocationIter.next();
                    
                       String locnum = Integer.toString(location.getLocnum());
            %>        
            <tr>
                 <td width="200" align="center" bgcolor="ffffff" height="20">
                    <a href="<c:url value='rentPlacePageDetail'>
                        <c:param name='locnum' value='<%=locnum%>'/>
                    </c:url>">
                  <%=location.getLocname()%> <%=location.getLocnum()%>호점</a> 
                 </td>    
            </tr>
            <%
                 }
               }
            %>        
           </table><br>   
      </td>
    </tr>
</table>
</body>
</html> 
