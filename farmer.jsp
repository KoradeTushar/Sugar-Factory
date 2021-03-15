<%-- 
    Document   : userlogin
    Created on : 3 Mar, 2021, 2:43:24 PM
    Author     : Tushar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>  
        <form action="inbox.jsp" method="post">   
        <%
          String UN = request.getParameter("un");
          String pass = request.getParameter("pass");  
          int tush;
          
           Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
           Statement stmt = con.createStatement();
           
           ResultSet rs = stmt.executeQuery("select FARMER_ID,USERNAME,PASSWORD from farmers where USERNAME='"+UN+"' and PASSWORD='"+pass+"' ");
          
        if(rs.next())
        {
         %>  
         
         <input type="hidden" id="<%=rs.getString(1)%>" name="h">  
         
         <% 
             
            response.sendRedirect("login.html");
        }
        else
        {
            out.print("<center>Invalid  Passward <a href=farmer.html> Try again </a></center>");
        }
        %>
    </form>    
  </body>       
        
    
</html>
 