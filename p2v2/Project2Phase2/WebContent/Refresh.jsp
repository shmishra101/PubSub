<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project2.Subscriber" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <% 
     String subscriberid=session.getAttribute("id").toString();
     Subscriber subscribe=new Subscriber();
     List<String> message=subscribe.getMessage(subscriberid);
     int j=0;
     while(j<message.size())
      { subscribe.updatemessagestatus(subscriberid, message.get(j));
        j=j+3;
      }
     
     PrintWriter outwriter=response.getWriter();
     response.setContentType("text/plain");
     response.setHeader("Cache-Control", "no-cache");
     response.setHeader("pragma","no-cache");
     //outprint.print(subscriberid);
     //String message="Sandesh loves ?????"+"\n"+"Hi How are you "+"\n"+"Kya kr rhe ho";
     StringBuffer outprint=new StringBuffer();
     j=0;
     if(message.size()==0)
     {   
    	 outprint.append("No New Messages");
    	 
     }
    // outprint.append(message.size());
    else
    { outprint.append(message.size()+"\n");
     while(j+2<message.size())
     {   
	     outprint.append("Publisher Name: "+ message.get(j+2)+"\n");
    	 outprint.append("Message: "+message.get(j+1)+"\n");
    	 j=j+3;
     }
    }
     outwriter.print(outprint.toString());
     outwriter.close();
    %>
</body>
</html>