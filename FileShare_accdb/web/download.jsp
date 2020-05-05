<%-- 
    Document   : download
    Created on : 20 Jul, 2019, 9:54:19 AM
    Author     : vivek
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <style>
a:link, a:visited {
    background-color: #006699;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
    background-color: #ccccff;
  color: #008CBA;
}
</style>
<body style="background-color: #0075c3">
        <%
     
            Connection con = null;
            PreparedStatement ps = null;
            String file = request.getParameter("file");
            String user = request.getParameter("user");
            String skey = request.getParameter("key");
            
            try {
                Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");

            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from files where filename = ? and skey = ?");
            ps.setString(1,file);
            ps.setString(2, skey);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                java.util.Date today = new java.util.Date();
                Statement st =null;
                st=con.createStatement();
                //ps= con.prepareStatement("insert into downloads (filename, downloaded_on, downloaded_by) values ('"+file+"','"+new java.sql.Date(today.getTime()).toString()+"','"+user+"')");
                st.execute("insert into downloads (filename, downloaded_on, downloaded_by) values ('"+file+"','"+new java.sql.Date(today.getTime()).toString()+"','"+user+"')");
        %><h1 style="color: white;font-family: monospace; letter-spacing: 5px; padding-left: 10%; padding-top: 6%;"> Your download link for the file is ready . . . </h1><center style="padding-top: 8%;"><h1><a href='<%=rs.getString("file")%>' download='<%=file%>' target='_blank'>Download Link</a><%
                out.print("<br/><br/><br/><br/><a href='user.jsp?fiter=.&msg="+request.getParameter("msg")+"&username="+request.getParameter("user")+"'>< Back To Main Page</a></center></h1>");
            }
            else{
                out.print("file match error");
            }
            }catch(SQLException ex){
            out.print(ex);
            }
                
            %>
            
    </body>
</html>
