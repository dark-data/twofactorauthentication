<%-- 
    Document   : authority
    Created on : 29 Jun, 2019, 8:28:10 PM
    Author     : vivek
--%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script src="js/loginandsignup.js" type="text/javascript"></script>

        <title>welcome</title>
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
        <% 
            Connection con = null;
            PreparedStatement ps = null;
        String msg = request.getParameter("status");
        if(msg .contains("uploaded"))
            out.print("<script> alert('uploaded successfully...'); </script>");
        %>
    <center>
        <button class="btn" onclick="authorityoption('home','fu','fsky')">Authority Home</button>
        <button class="btn" onclick="authorityoption('fu','fsky','home')">File Upload</button>
        <button class="btn" onclick="authorityoption('fsky','fu','home')">File Secret Key</button>
        <button class="btn" style="color: orangered;"><a href="logout.jsp" style="text-decoration: none; color: tomato;">logout</a></button>

        <hr width="80%" color="white">
        <br><br>
        <div id="home" style="background-color: #4f5c9b; width: 80%; border-radius: 5px;">
            <h2 style="color:white;padding: 10px 10px"> Welcome! user</h2>
        </div>
        <div class="fsk" id="fsky">
            <h1 style="color:white; align:center;">File Secret Key</h1>
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
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            String aname = request.getParameter("uname");
            String pass = request.getParameter("upass");
            String utype = request.getParameter("utype");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from request where tstatus = 'approve' and astatus <> 'approve'");
            //ps.setString(1,"N");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                
                out.print("<tr> <td>"+rs.getString("filename")+"</td><td>"+rs.getString("date1")+"</td><td>"+rs.getString("size")+"MB</td><td>"+rs.getString("username")+"</td><td><a href='a_response.jsp?file="+rs.getString("filename")+"&username="+rs.getString("username")+"&aname="+aname+"&pass="+pass+"&type="+utype+"' style='width:100%; height:available;'><button class='btn' style='width:100%; height: 100%; padding:0px 0px; color: #09823e; font-size:20px; '>grant access</button></a></td>   </tr>");
            }
        }catch(SQLException e){out.print(e);}
                    
                   %> 
            </table>
        </div>
        <!--file upload*-->
        <div class=" fsk" id="fu">
            <form class="form" method="post" enctype="multipart/form-data" action="fileupload.jsp" style=" width: min-content; border-radius: 5px; background-color: #f2f2f2; padding: 30px;">
                <input id="box" class="btn" style="color:cornflowerblue;" name="file" type="file" class="file-upload-field" value="">
                <input type="submit" value="upload">
            </form>
        </div>
    </center>
    </body>
</html>
