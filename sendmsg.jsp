<%-- 
    Document   : sendmsg
    Created on : 9 Mar, 2021, 11:30:57 PM
    Author     : Tushar
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String Fid = request.getParameter("fid");
            String MSG = request.getParameter("msg");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            int i = stmt.executeUpdate("insert into messages values('"+MSG+"',"+Fid+")");
            
            if(i>0)
            {
                out.println("<center>Message sent .....Back to <a href=login.html> welcome page</a></center>");
            }
            else
            {
                out.println("<center>Message Not sent .....<a href=sendmsg.html>Try again</a></center>");
            }
        %>
    </body>
</html>
