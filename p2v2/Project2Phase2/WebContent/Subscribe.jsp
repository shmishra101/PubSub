<%@page import="project2.Subscriber"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
   String id=session.getAttribute("id").toString();
   String publisherid=request.getParameter("dwld");
   String action=request.getParameter("button");
   Subscriber subscriber=new Subscriber();
   if(action.equals("Subscribe"))
   {
	   subscriber.subscribepublisher(id, publisherid);
	   response.sendRedirect("Subscriber_Profile.jsp");
   }
   else
   {
	   subscriber.unsubscribe(id, publisherid);
	   response.sendRedirect("Subscriber_Profile.jsp");
   }
 %>
             
</body>
</html>