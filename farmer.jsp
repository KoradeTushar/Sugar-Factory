<%-- 
    Document   : userlogin
    Created on : 3 Mar, 2021, 2:43:24 PM
    Author     : Tushar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript">
            function xyz()
            {
                String navin = rs.getString(1);
                return navin;
            }
        </script>
        <title>JSP Page</title> 
    </head>
    
      
               
        <%
          String UN = request.getParameter("un"); 
          String pass = request.getParameter("pass");   
          String xyz;
          
           Class.forName("oracle.jdbc.driver.OracleDriver");     
           Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
           Statement stmt = con.createStatement();
           
           ResultSet rs = stmt.executeQuery("select FARMER_ID,FNAME,LNAME from farmers where USERNAME='"+UN+"' and PASSWORD='"+pass+"' ");
           
            
        if(rs.next())
        {
            int i = rs.getInt(1); 
          session.setAttribute("FarmerID",i);
            
          String x = rs.getString(2); 
          session.setAttribute("fname",x);
           
          out.print(x);
          
          response.sendRedirect("login.html");
        }
        else
        {
            out.print("<center>Invalid  Passward <a href=farmer.html> Try again </a></center>");
        }
        %>
        
         
        
    

 