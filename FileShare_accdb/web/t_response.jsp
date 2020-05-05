<%-- 
    Document   : t_response
    Created on : 10 Jul, 2019, 10:12:17 PM
    Author     : vivek
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% String username = request.getParameter("username");
            String file = request.getParameter("file");
            Connection con = null;
            try {
                Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
                Statement st = conn.createStatement();
                st.executeUpdate("update request set tstatus='approve' where username='"+username+"' AND filename='"+file+"'");
                response.sendRedirect("trustee.jsp?uname="+request.getParameter("tname")+"&upass"+request.getParameter("pass")+"&utype"+request.getParameter("type"));
                out.print("<script>alert('successfully responded');</script>");
            } catch (Exception e) {
                out.print(e);
            }


                %>
    </body>
</html>
