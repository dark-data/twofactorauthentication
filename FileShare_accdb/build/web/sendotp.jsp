<%-- 
    Document   : testotp
    Created on : 2 Jul, 2019, 8:46:59 AM
    Author     : vivek
--%>
<%@ page import="java.sql.*" %>
<%@page import="way2sms.otp" %>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>processing otp request</title>
        <style>
            #bt{
padding: 15px 10px;
margin: 8px 0 ;
border: 2px solid #EBDEF0;
border-radius: 5%;
}

#bt:hover {opacity: 0.4;}
     #box{
padding: 15px 10px;
margin: 8px 0 ;
border: 2px solid #EBDEF0;
border-radius: 5%;
}
        </style>
    </head>
    <body>
        <%! 
// declsre vrible here
        Connection con;
        PreparedStatement ps;%>
        <%
            String phone = request.getParameter("phone");
            Random s = new Random();
    int a = s.nextInt(9000 - 3000)+1000;
    System.out.print(a);
    String key = String.valueOf(a);
   String msg = "\nOne time Key:  " +key;
        //new otp().sendCampaign(phone, msg);
        out.print("otp sent");
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
                        Statement st = conn.createStatement();
                        //st.executeUpdate("update useraccounts set otp='"+a+"' where phone='"+phone+"'");
                    } catch (Exception e) {
                        out.print(e);
                    }
        %><center>
        <% out.print("<form method ='get' action = 'verifyotp.jsp?user="+request.getParameter("username")+"' >"); %>
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter otp" name = "otp" size ="20" maxlength ="30" required>
                <br>
                <%out.print("<input type='hidden' name='phone' value='"+phone+"'>");%>

  <input type = "submit"  id="bt" value ="verify" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="bt" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

        </form></center>
    </body>
</html>
