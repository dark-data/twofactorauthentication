<%-- 
    Document   : verifyotp
    Created on : 2 Jul, 2019, 10:07:29 AM
    Author     : vivek
--%>
<%@page import="EncryptionDecryption.TrippleDes" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body><% String user=request.getParameter("user"); %>
        <%! 
// declsre vrible here
        Connection con;
        PreparedStatement ps;

        %>
        <%                            
            try {
                
                Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from useraccounts where phone = ? and otp = ?");
            ps.setString(1,request.getParameter("phone"));
            ps.setString(2,request.getParameter("otp"));
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                response.sendRedirect("user.jsp?filter=.&msg="+request.getParameter("phone")+"&username="+rs.getString("username"));
            }
            else{
                                %><jsp:include page="index.jsp"></jsp:include>
<%
                out.print("<script>alert('username or password invalid');</script>");
            }
        } catch (Exception ex) {
            out.print(ex);
        }
%>
    </body>
</html>
