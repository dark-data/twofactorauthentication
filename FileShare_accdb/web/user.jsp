<%-- 
    Document   : user
    Created on : 29 Jun, 2019, 8:28:28 PM
    Author     : vivek
--%>
<%@ page import="java.sql.*" %>

<%@page import="EncryptionDecryption.TrippleDes " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/loginandsignup.js" type="text/javascript"></script>
        <title>user-page</title>
        <style>
            .btn {
                border: none;  
                background-color: inherit;  
                padding: 34px 48px ;
                font-size: 32px;
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
                background: #4f5c9b;
                border-radius: 5px;
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
        
<%HttpSession nsession = request.getSession(false);
if(nsession!=null) {
   String data=(String)session.getAttribute("usertype");
}
else
response.sendRedirect("index.jsp");
%>
    <% String a= request.getParameter("msg");
        //if(!(a.contains("verified")))
        //    response.sendRedirect("index.html");
        String username =request.getParameter("username");
        String fil = "N";
        Connection con = null;
        PreparedStatement ps = null;
        /*try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from useraccounts where username =? ");
            ps.setString(1,new TrippleDes().decrypt(username));
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                
            }else{
                response.sendRedirect("index.jsp");
            }
        }catch(Exception ex){
            out.print(ex);
        }*/
    %>
    
    
    <center>
        <button class="btn" onclick="useroption('tr','ask','fd')" style="color: activecaption;">Trustee Request</button>
        <button class="btn"  onclick="useroption('ask','tr','fd')">Authority Secret Key</button>
        <button class="btn" onclick="useroption('fd','tr','ask')">File Download</button>
        <button class="btn" style="color: orangered;"><a href="logout.jsp" style="text-decoration: none; color: tomato;">logout</a></button>
        <hr width="60%" color="white">
        <br><br>
        <div id="home" style="background-color: #4f5c9b; width: 80%; border-radius: 5px;">
            <h2 style="color:white;padding: 10px 10px"> Welcome! user</h2>
        </div>

                <%                     

                    out.print("<div class='fsk' id='tr'><h1 style='color:white; align:center;'>Trustee File Request</h1> <table cellspacing='0' cellpadding='0' border='0' width='50%' class='fixed_header'><thead> <tr>  <th>File name</th>  <th>Uploaded on</th>    <th>Size</th> <th>Trustee Request</th> </tr> </thead> ");
        String msg=request.getParameter("msg");
           try {
               Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from files");
            //ps.setString(1,"N");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
             //need to work on
                out.print("<tr> <td>"+rs.getString("filename")+"</td><td>"+rs.getDate("date1")+"</td><td>"+rs.getString("size").toString()+"</td><td><a href='u_request.jsp?file="+rs.getString("filename")+"&size="+rs.getString("size")+"&msg="+msg+"&username="+username+"' style='width:100%; height:available;'><button class='btn' style='width:100%; height: 100%; padding:0px 0px; color: #09823e; font-size:20px; '>Request</button></a></td> </tr>");
                }
           }catch(Exception e){out.print(e);}
                out.print("</table></div>");
                
                %>
            
        
        <div class="fsk" id="ask">
            <h1 style="color:white; align:center;">Authority Secret Key</h1>
            <table cellspacing="0" cellpadding="0" border="0" width="50%" class="fixed_header">
                <thead>
                    <tr>
                        <th>File name</th>
                        <th>Uploaded on</th>
                        <th>Size</th>
                        <th>Authority Secret Key</th>                        
                    </tr>
                </thead>
                <% // to be completed
                        try {
                            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from request where astatus = 'approve' and username='"+request.getParameter("username")+"'");
            //ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
             out.print("<tr> <td>"+rs.getString("filename")+"</td><td>"+rs.getString("date1")+"</td><td>"+rs.getString("size")+"</td><td>"+rs.getInt("skey")+"</td> </tr>");
                }
           }catch(SQLException e){out.print(e);}
                %>
            </table>
        </div>
        
        
        <div class="fsk" id="fd">
            <h1 style="color:white; align:center;">File Download</h1>
            <table cellspacing="0" cellpadding="0" border="0" width="50%" class="fixed_header">
                <thead>
                    <tr>
                        <th>File name</th>
                        <th>Uploaded On</th>
                        <th>Size</th>
                        <th>File Download</th>
                    </tr>
                </thead>
                <% // to be completed
                        try {
                            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from request where astatus = 'approve' and username='"+request.getParameter("username")+"'");
            //ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
             out.print("<tr> <td>"+rs.getString("filename")+"</td><td>"+rs.getString("date1")+"</td><td>"+rs.getString("size")+"</td><td><a href='filedownload.jsp?file="+rs.getString("filename")+"&username="+username+"&size="+rs.getString("size")+"&msg="+request.getParameter("msg")+"' style='width:100%; height:available;'><button class='btn' style='width:100%; height: 100%; padding:0px 0px; color: #09823e; font-size:20px; '>Download</button></a></td> </tr>");
                }
           }catch(SQLException e){out.print(e);}
                %>
            </table>
        </div>
        
    </center>
    </body>


</html>

