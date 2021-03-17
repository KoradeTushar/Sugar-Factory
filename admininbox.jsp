<%-- 
    Document   : admininbox
    Created on : 17 Mar, 2021, 1:15:34 AM
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
            
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("select * from farmer_messages");
             
            
            %>
    <center>
        <h1>All Messages from farmers</h1>
            <table border="2" cellspacing="10" cellpadding="50">
                <tr>
                    <th>Message From</th>
                    <th>Message</th>
                </tr>
                <%  while(rs.next())
                {
               %>
                <tr>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(1)%></td>
                </tr>
                <%
            }  
        %> 
            </table>
            <a href="admin.html"><button>Go Back</button></a>
    </center>
    
            
            
    </body>
</html>
