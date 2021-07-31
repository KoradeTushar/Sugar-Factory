<%-- 
    Document   : bookingstaff
    Created on : 29 Jul, 2021, 12:42:59 PM
    Author     : Tushar
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript">
            function TUS()
            {
                String old = rs.getString(1);
                return old;
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body bgcolor="sky blue">
        <%
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
        String old;
            
        ResultSet rs = stmt.executeQuery("select * from sugarcane");
        
        %>
    <center><h1>Booking List</h1></center>
        
        
    <center>
        <form action="bookaction.jsp" method="post">
            <table border="2" cellspacing="20" cellpadding="50" bgcolor="white">
            <tr>
                <th>Farmer_ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Approx_Weight</th>
                <th>Date</th>
                <th>Status</th>
                <th>Actions</th>                         
            </tr>
            <%
                while(rs.next())
                {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getInt(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                
                <th><input type="submit" value="Approve" name="action">
                    <input type="submit" value="Decline" name="action">
                    <input type="submit" value="pending" name="action">
                </th>
                    
                    
                    
                    
            <%  
                    int i = rs.getInt(1); 
                    session.setAttribute("Approve",i);
            %>
                
                
            </tr>
            <%
            }
            %>
            </table>
        </form>
    </center>    
        
        
    </body>
</html>
