<%-- 
    Document   : signup
    Created on : 3 Mar, 2021, 3:15:57 PM
    Author     : Tushar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .center{
                font-size:100px;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String fnm = request.getParameter("fname");
            String lnm = request.getParameter("lname");
            String mnm = request.getParameter("mname");
            String ad = request.getParameter("add");
            String gender = request.getParameter("gender");
            String survey = request.getParameter("sn");
            int SN = Integer.parseInt(survey);
            String EA = request.getParameter("ea");
            String satbara = request.getParameter("sat");
            String area = request.getParameter("area");
            
            String typeofs = request.getParameter("sugarcane");
            String ldate = request.getParameter("lagvad");
            String expect = request.getParameter("expect");
            
            String NF = request.getParameter("nf");
            String bank = request.getParameter("bank");
            String accountno = request.getParameter("an");
            int act = Integer.parseInt(accountno);
            String IFSC = request.getParameter("ifsc");
            int ifsc = Integer.parseInt(IFSC);
            String acctype = request.getParameter("acctype");
            String username = request.getParameter("user");
            String passward = request.getParameter("pass");
            
            
            
           Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sugarfactory","sf123");
           Statement stmt = con.createStatement();
           
           int i = stmt.executeUpdate("insert into farmers values(farmer_id.nextval,'"+fnm+"','"+lnm+"','"+mnm+"','"+ad+"','"+gender+"',"+SN+",'"+EA+"','"+satbara+"','"+area+"','"+NF+"','"+bank+"',"+act+","+ifsc+",'"+acctype+"','"+username+"','"+passward+"')");
          
           ResultSet rs = stmt.executeQuery("select FARMER_ID from farmers where USERNAME='"+username+"' and PASSWORD='"+passward+"'");
          
           if(i>0)
            {
                out.println("<center>Registration Successful....<a href=farmer.html>Go Back to Farmer login</a></center>");
                out.println("<center>Your Farmer ID is </center>");
                
                if(rs.next())
                {
                %>
<div class="center">
    <center>
        <b>
                <%=rs.getInt(1)%>
        </b>
    </center> 
</div>
                <%
                    }
            }
            else
            {
                response.sendRedirect("register.jsp");
            }
        %>
    </body>
</html>
