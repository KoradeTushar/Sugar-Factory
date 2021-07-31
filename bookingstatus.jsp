<%-- 
    Document   : bookingstatus
    Created on : 29 Jul, 2021, 10:52:18 AM
    Author     : Tushar
--%>

<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="booking.css">  
        <title>JSP Page</title>
    </head>
    <body>
        <div class="wrapper">
    <div class="title">
      Booking Status    
    </div>
    <div class="form">      
        <div class="inputfield">
          <label>Status</label>
          
           <% 
            
            int k = (Integer) session.getAttribute("FarmerID");
               
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
            Statement stmt = con.createStatement();
            
            
            ResultSet rs = stmt.executeQuery("select STATUS from SUGARCANE where FID="+k+" ");
            
            while(rs.next())
        {
            %>
            
            <%=rs.getString(1)%>
            
        <%    
        }
        %>
        
        
           
            
    </div>
        <div class="inputfield">
            <a href="login.html"><input type="button" value="Go Back" class="btn"></a>
      </div> 
</div>
    </body>
</html>
