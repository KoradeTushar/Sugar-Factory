<%-- 
    Document   : staffregister
    Created on : 9 Mar, 2021, 2:08:19 PM
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
        <%
            String fnm = request.getParameter("fname");
            String lnm = request.getParameter("lname");
            String add = request.getParameter("add");
            String gender =request.getParameter("gender");
            String SP = request.getParameter("sp");
            String us = request.getParameter("user");
            String ps = request.getParameter("pass");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            int i = stmt.executeUpdate("insert into staff values('"+fnm+"','"+lnm+"','"+add+"','"+gender+"','"+SP+"','"+us+"','"+ps+"')");
            
            if(i>0)
            {
                out.println("<center>Registration Successful.....<a href=staff.html>Go to staff login</a></center>");
            }
            else
            {
                out.println("<center>Registration failed.....<a href=staffregister.html>Try again</a><center>");
            }
        %>
    </body>
</html>
