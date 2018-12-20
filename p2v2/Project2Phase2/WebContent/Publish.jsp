<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project2.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
  String message=request.getParameter("event");
  String id=session.getAttribute("id").toString();
  String publish=request.getParameter("submit");
  out.println(message);
  out.println(id);
  out.println(publish);
  Random rand = new Random(); 
  int eventid = rand.nextInt(50);
  Publisher publisher=new Publisher();
  if(publish.equals("Publish"))
  {
	 List<String> subscriber=publisher.publish(id,eventid, message);
	 out.println(subscriber.size());
	 out.println(subscriber);
	 publisher.notify(subscriber, message,eventid,id);
	 // publisher.n
	 response.sendRedirect("Publisher_Profile.jsp");
  }
  
  
%>
<body>

</body>
</html>