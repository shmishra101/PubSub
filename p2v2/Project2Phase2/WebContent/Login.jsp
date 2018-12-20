<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mongodb.*" %>
<%@ page import="project2.MongoConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<% 
String id,pwd,usertype;
id=request.getParameter("user");
pwd=request.getParameter("password");
usertype=request.getParameter("select");
out.println("Username:"+id);
out.println("Usertype:"+usertype);
out.println("Password:"+pwd);
MongoConnect mongoconnect=new MongoConnect();
DB db=mongoconnect.getConnection("Project2");
DBCollection collection=null;
String redirect=null;
if(usertype.equals("Publisher"))
{
	collection=mongoconnect.getCollection(db, "publisher");
	redirect="Publisher_Profile.jsp";
}
else
{
	collection=mongoconnect.getCollection(db, "subscriber");
	redirect="Subscriber_Profile.jsp";
}
DBObject doc=new BasicDBObject();
doc.put("id", id);
doc.put("password", pwd);
DBCursor dbcursor=collection.find(doc);
if(dbcursor.hasNext())
{
	session.setAttribute("id",id);
	out.println("Login Successfull");
	response.sendRedirect(redirect);
}
else
{    
	//response.sendRedirect("Home.jsp");
	session.setAttribute("errormessage", "Invalid Login");
}
%>
<body>
    
</body>
</html>