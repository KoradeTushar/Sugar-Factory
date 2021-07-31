<%-- 
    Document   : staff
    Created on : 7 Mar, 2021, 2:48:53 PM
    Author     : Tushar
--%>

<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
            String un = request.getParameter("un");
            String Pass = request.getParameter("ps");
            String post = request.getParameter("post"); 
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("select * from staff where USERNAME='"+un+"' and PASSWORD='"+Pass+"' and STAFF_POST='"+post+"' ");
          
  
        if(rs.next())
        {
            
           if(post.equals("admin")) 
           {
               response.sendRedirect("admin.html");
           }
           else if(post.equals("BookingManager"))
           {
               response.sendRedirect("bookingstaff.jsp"); 
           }
           else if(post.equals("production_manager"))
           {
               response.sendRedirect("production_manager.html");
           }
        }
        else
        {
            out.print("<center>Login Failed <a href=staff.html> Try again </a></center>");
        }
        %>
        
        
        
        
    </body>
</html>
