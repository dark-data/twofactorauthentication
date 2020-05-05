<%-- 
    Document   : a_response
    Created on : 11 Jul, 2019, 7:10:52 PM
    Author     : vivek
--%>
<%@page import="Mail.MailSender"%>
<%@page import="java.sql.*"%>
<%@page import="Mail.MailSender.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%//to be completed with updation of file secrect key 
            String username = request.getParameter("username");
            String file = request.getParameter("file");
            String skey = "";
            Connection con = null;
            PreparedStatement ps = null;
            try {
                Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
                Statement st = conn.createStatement();
                //skey updation goes here
                ps = conn.prepareStatement("select * from files where filename=?");
                ps.setString(1, file);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    skey = rs.getString("skey");
                    st.executeUpdate("update request set astatus='approve', skey='"+skey+"' where username='"+username+"' AND filename='"+file+"'");
                    Mail.MailSender m = new MailSender();
                    m.sendMail(username, "file request has been approved", "secret key: "+skey);
                }
                response.sendRedirect("authority.jsp?uname="+request.getParameter("aname")+"&upass="+request.getParameter("pass")+"&utype="+request.getParameter("type")+"&status= ");
                
                
                out.print("<script>alert('access granted successfully');</script>");
            } catch (Exception e) {
                out.print(e);
            }
%>
    </body>
</html>
