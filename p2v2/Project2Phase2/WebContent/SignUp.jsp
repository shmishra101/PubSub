<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mongodb.*" %>
<%@ page import="project2.MongoConnect" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
String id,pwd,usertype,name,type;
id=request.getParameter("user");
pwd=request.getParameter("password");
usertype=request.getParameter("select");
name=request.getParameter("name");
out.println("Name:"+name);
out.println("Username:"+id);
out.println("Usertype:"+usertype);
out.println("Password:"+pwd);
MongoConnect mongoconnect=new MongoConnect();
DB db=mongoconnect.getConnection("Project2");
out.println(db);
DBCollection collection=null;
String redirect=null;
if(usertype.equals("Publisher"))
{
	collection=mongoconnect.getCollection(db, "publisher");
	type="Subscriber";
	out.println(collection);
	redirect="Home.jsp";
}
else
{
	collection=mongoconnect.getCollection(db, "subscriber");
	type="Publisher";
	out.print(collection);
	redirect="Home.jsp";
}
DBObject doc=new BasicDBObject();
doc.put("id",id);
doc.put("password", pwd);
DBCursor dbcur=collection.find(doc);
if(dbcur.count()==0)
{ doc.put("name", name);
  List<String> list=new ArrayList<String>();
  doc.put(type, list);
  collection.insert(doc);
  mongoconnect.closeConnection();
  response.sendRedirect("Home.jsp");
}
else
{
	out.println("Username already exist");
}
%>
<body>

</body>
</html>