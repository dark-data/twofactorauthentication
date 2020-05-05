<%-- 
    Document   : login
    Created on : 29 Jun, 2019, 8:59:24 PM
    Author     : vivek
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>validating user</title>
    </head>
    <body>
        <%! 
// declsre vrible here
        Connection con;
        PreparedStatement ps;
        String type, fnme, lnme, username, bday, psw, phone="";

%>
<%
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
    type=request.getParameter("utype") ;
    username = request.getParameter("uname"); 
    psw =request.getParameter("upass");
SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
// db code here
    if(type.contains("signup")){
        fnme = request.getParameter("fname");
        lnme = request.getParameter("lname");
        bday = request.getParameter("bday").toString();
        //bday = Date.valueOf(sdf.format(bd));
        phone = request.getParameter("phone");
        try {
                con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
                ps= con.prepareStatement("select * from useraccounts where username = ? or phone = ?");
                ps.setString(1,username);
                ps.setString(2,phone);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                                    %><jsp:include page="index.jsp"></jsp:include>
<%
                                            out.print("<script>alert('username or phone number already taken!!, try another username');</script>");   



                }
                else{
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
                        Statement st = conn.createStatement();
                        st.execute("insert into useraccounts(fname,lname,username,password, email, phone, bdate, type, otp) values('"+fnme+"','"+lnme+"','"+username+"','"+psw+"','"+username+"','"+phone+"','"+bday+"','user',0)");
                        out.print("<script>alert('registered successfully');</script>");
                    } catch (Exception e) {
                        System.out.print(e);
                    }
                    
                }   
            }catch(Exception e){}
    }else if(type.contains("user")){
        String pno;
        try {
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from useraccounts where username = ? and password = ? and type='user'");
            ps.setString(1,username);
            ps.setString(2, psw);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                pno=rs.getString("phone");
                session.setAttribute("name",username);
                session.setAttribute("usertype", type); 
                response.sendRedirect("sendotp.jsp?phone="+pno+"&username="+username);
            }
            else{
                                %><jsp:include page="index.jsp"></jsp:include>
<%
                out.print("<script>alert('username or password invalid');</script>");
            }
        } catch (Exception ex) {
            out.print(ex);
        }
    }else if(type.contains("authority")){
        try {
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from useraccounts where username = ? and password = ? and type='authority'");
            ps.setString(1,username);
            ps.setString(2, psw);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                session.setAttribute("name",username);
                session.setAttribute("usertype", type); 
                %><jsp:include page="authority.jsp"></jsp:include>
<%            }
            else{
                                %><jsp:include page="index.jsp"></jsp:include>
<%
                out.print("<script>alert('username or password invalid');</script>");
            }
        } catch (Exception ex) {
            out.print(ex);
        }
    }else if(type.contains("cloud")){
        try {
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from useraccounts where username = ? and password = ? and type='cloud'");
            ps.setString(1,username);
            ps.setString(2, psw);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                session.setAttribute("name",username);
                session.setAttribute("usertype", type); 
                %><jsp:include page="cloud.jsp"></jsp:include>
<%            }
            else{
                %><jsp:include page="index.jsp"></jsp:include>
<%
                out.print("<script>alert('username or password invalid');</script>");
            }
        } catch (Exception ex) {
            out.print(ex);
        }
    }else if(type.contains("trustee")){
        try {
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= con.prepareStatement("select * from useraccounts where username = ? and password = ? and type='trustee'");
            ps.setString(1,username);
            ps.setString(2, psw);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                session.setAttribute("name",username);
                session.setAttribute("usertype", type); 
                %><jsp:include page="trustee.jsp"></jsp:include>
<%            }
            else{
                %><jsp:include page="index.jsp"></jsp:include>
<%
                out.print("<script>alert('username or password invalid');</script>");
            }
        } catch (Exception ex) {
            out.print(ex);
        }
    }else{
                %><jsp:include page="index.jsp"></jsp:include>
<%
   out.print("error");
    }
%>
    </body>
</html>
