<%-- 
    Document   : trustee
    Created on : 29 Jun, 2019, 8:28:53 PM
    Author     : vivek
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/loginandsignup.js" type="text/javascript"></script>
        <title>JSP Page</title>
    <style>
            .btn {
                border: none;  
                background-color: inherit;  
                padding: 34px 48px ;
                font-size: 42px;
                cursor: pointer;
                display: inline-block;
                color: white;
            }
            .btn:hover {
                opacity: 0.4;
            }
            table{   
                width:60%;
                height: 20%;
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 5px;
            }
            .div{
                align: center;
                border-radius: 4px;
                width:100%;
                height:7%;
                background-color: #504d4c;
            }
            .fixed_header{
                table-layout: fixed;
                border-collapse: collapse;
            }
            .fixed_header tbody{
                display:block;
                width: 100%;
                overflow: auto;
                height: 200px;
                align-content: center;
            }
            .fixed_header thead tr {
                display: flex;
            }
            .fixed_header thead {
                background: black;
                color:#fff;
            }
            .fixed_header th, .fixed_header td {
                padding: 10px;
                text-align: left;
                width: 150px;
            }
            .fsk {
                display: none;
            }
        </style>
    </head>
    <body background="images/test.jpg">
        <%!
            Connection con = null;
            Statement st = null;
            %>
    <center>
        <button class="btn" onclick="trusteeoption('home','fsk')">Trustee Home</button>
        <button class="btn" onclick="trusteeoption('fsk','home')">File Security Response</button>
        <button class="btn" style="color: orangered;"><a href="logout.jsp" style="text-decoration: none; color: tomato;">logout</a></button>
        
        <hr width="60%" color="white">
        <br><br>
        <div id="home" style="background-color: #4f5c9b; width: 80%; border-radius: 5px;">
            <h2 style="color:white;padding: 10px 10px"> Welcome! trustee</h2>
        </div>
        <div class="fsk" id="fsk">
            <h1 style="color:white; align:center;">File Security Response</h1>
            <table cellspacing="0" cellpadding="0" border="0" width="50%" class="fixed_header">
                <thead>
                    <tr>
                        <th>file name</th>
                        <th>Uploaded on</th>
                        <th>Size</th>
                        <th>Requested by</th>
                        <th>Status</th>                        
                    </tr>
                </thead>
                <%
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");                    
        try {
            String tname = request.getParameter("uname");
            String pass = request.getParameter("upass");
            String utype = request.getParameter("utype");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            st= con.createStatement();
            //ps.setString(1,"N");
            ResultSet rs = st.executeQuery("select * from request where tstatus = 'pending'");
            while(rs.next()){
                
                out.print("<tr> <td>"+rs.getString("filename")+"</td><td>"+rs.getString("date1")+"</td><td>"+rs.getString("size")+"MB</td><td>"+rs.getString("username")+"</td><td><a href='t_response.jsp?file="+rs.getString("filename")+"&username="+rs.getString("username")+"&tname="+tname+"&pass="+pass+"&type="+utype+"' style='width:100%; height:available;'><button class='btn' style='width:100%; height: 100%; padding:0px 0px; color: #09823e; font-size:20px; '>response</button></a></td>   </tr>");
            }
        }catch(SQLException e){out.print(e);}
                    
                   %> 
            </table>
        </div>
    </center>
    </body>
</html>
