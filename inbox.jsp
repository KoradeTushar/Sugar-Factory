<%-- 
    Document   : inbox
    Created on : 9 Mar, 2021, 11:48:45 PM
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
            String  FID = request.getParameter("h");      
            %> 
            
            <%=FID%>
            
            <%       
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("select message from messages where FARMER_ID="+FID+"  ");


            while(rs.next())
            {
         %> 
    <center>
        <%=rs.getString(1)%>
        <%="hii"+FID+"hii"%>
    </center>   
        <%
            }
        %>
    </body>
</html>
