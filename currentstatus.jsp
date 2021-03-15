<%-- 
    Document   : currentstatus
    Created on : 10 Mar, 2021, 1:04:37 AM
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
         String FID = request.getParameter("fid");
         int Fid = Integer.parseInt(FID);
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("select * from farmers where FARMER_ID="+Fid+"");
        
        while(rs.next())
        {
        %>
        
    <center>
        <h1>Current Status</h1>
        <table border="2" cellspacing="20" cellpadding="50">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Area</th>
                <th>Type of Sugarcane</th>
                <th>Lagvad Date</th>
                <th>Expect date</th>
            </tr>
            <tr>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(10)%></td>
                <td><%=rs.getString(11)%></td>
                <td><%=rs.getString(12)%></td>
                <td><%=rs.getString(13)%></td>
            </tr>
        </table>
    </center>    
        <%
        }
        %>
    </body>
</html>
