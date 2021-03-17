<%-- 
    Document   : admin
    Created on : 17 Mar, 2021, 12:39:55 AM
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
            String nm = request.getParameter("nm"); 
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            int i = stmt.executeUpdate("insert into messages values('"+nm+"','admin')");
                     
            if(i>0)
            {
                out.print("Message sent.....<a href=admin.html>Go Back</a> ");
            }
            else
            {
                response.sendRedirect("#");
            }
        %> 
    </body>
</html>
