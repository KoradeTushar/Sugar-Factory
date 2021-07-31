<%-- 
    Document   : bookaction
    Created on : 29 Jul, 2021, 1:00:21 PM
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
        <h1>Hello World!</h1>
        <%
            String action = request.getParameter("action");
            
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            
        int z = (Integer) session.getAttribute("Approve");
        
        
         ResultSet rs = stmt.executeQuery("update sugarcane set STATUS ='"+action+"' where FID="+z+" ");
         
         response.sendRedirect("bookingstaff.jsp");
         
        %>
    </body>
</html>
