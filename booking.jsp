<%-- 
    Document   : booking
    Created on : 28 Jul, 2021, 11:29:17 PM
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
            String fnm = request.getParameter("fname");
            
            String lnm = request.getParameter("lname");
            
            String FD = request.getParameter("FID");
            int Fid = Integer.parseInt(FD);
            
            String a = request.getParameter("Area");
            int area = Integer.parseInt(a);
            
            String type = request.getParameter("Type");
            
            String weight = request.getParameter("weight");
            int wt = Integer.parseInt(weight);
            
            String date = request.getParameter("Date");
            
            String pending = "pending";
            
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            int i = stmt.executeUpdate("insert into sugarcane values("+Fid+",'"+fnm+"','"+lnm+"',"+wt+",TO_DATE('"+date+"','YYYY-MM-DD'),'"+pending+"')");
            
            if(i>0)
            {
                out.println("<center>Booking Successful....<a href=login.html>Go Back</a></center>");
            }

          %>
    </body>
</html>
