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
            String pass = request.getParameter("pass");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("select USERNAME,PASSWORD from .... where USERNAME="+un+" and PASSWORD="+pass+"");
            
        if(rs.next())
        {
            session.setAttribute("un",pass);
            response.sendRedirect("login.html");
        }
        else
        {
            out.print("<center>Invalid Passward <a href=farmer.html> Try again </a></center>");
        }
        %>
        
        
        
        
    </body>
</html>
