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
            
            Class.forName("oracle.jdbc.driver.OracleDriver");    
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            int k = (Integer) session.getAttribute("FarmerID");
            
            ResultSet rs = stmt.executeQuery("select message from messages where msg_from='admin'");

                %>
    <center>
                <table border="2" cellspacing="10" cellpadding="50">
                    <tr>
                        <th>Messages from admin</th>
                    </tr>
                    <%
                    while(rs.next())
                    {  
                    %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                    </tr>
                    <%
            }
        %>
                </table>
                <center><a href="login.html"><button>Go Back</button></a></center>
    </center>      
    
    </body>
</html>
