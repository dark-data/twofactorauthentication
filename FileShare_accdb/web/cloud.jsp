<%-- 
    Document   : cloud
    Created on : 29 Jun, 2019, 8:28:20 PM
    Author     : vivek
--%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/loginandsignup.js" type="text/javascript"></script>

        <title>cloud Page</title>
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
            .cd {
                display: none;
            }
        </style>

    </head>
    <body background="images/test.jpg">
    <center>
        <button class="btn" onclick="cloud('home','cd','fu')">Cloud Home</button>
        <button class="btn" onclick="cloud('fu','home','cd')">Upload File</button>
        <button class="btn" onclick="cloud('cd','home','fu')">Cloud Downloads</button>
        <button class="btn" style="color: orangered;"><a href="logout.jsp" style="text-decoration: none; color: tomato;">logout</a></button>

        <hr width="60%" color="white">
        <br><br>
        <div id="home" style="background-color: #4f5c9b; width: 80%; border-radius: 5px;">
            <h2 style="color:white;padding: 10px 10px"> Welcome! Cloud</h2>
        </div>
        <div class="cd" id="cd">
            <h1 style="color:white; align:center;">Cloud Downloads</h1>
            <table cellspacing="0" cellpadding="0" border="0" width="50%" class="fixed_header">
                                <thead>
                    <tr>
                        <th>file name</th>
                        <th>Downloaded by</th>
                        <th>Downloaded on</th>
                    </tr>
                </thead>
                   <%
        Connection con = null;
        PreparedStatement ps = null;
        try {
            String aname = "";
            String pass = "";
            String utype = "";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from downloads");
            //ps.setString(1,"N");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){                
                out.print("<tr> <td>"+rs.getString("filename")+"</td><td>"+rs.getString("downloaded_on")+"</td><td>"+rs.getString("downloaded_by")+"</td><td></tr>");
            }
        }catch(Exception e){}
                    
                   %>
            </table>
        </div>
        <div class="cd" id="fu">
            <form class="form" style=" width: min-content; border-radius: 5px; background-color: #f2f2f2;    padding: 30px;  ">
                <input id="box" class="btn" style="color:cornflowerblue;" name="file-upload-field" type="file" class="file-upload-field" value="">
            </form>
        </div>
    </center>      
    </body>
</html>
