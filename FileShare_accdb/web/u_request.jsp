<%-- 
    Document   : u_request
    Created on : 8 Jul, 2019, 7:37:50 PM
    Author     : vivek
--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>

<%@page import="EncryptionDecryption.TrippleDes " %>
<%@page import="FileUpload.Upload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>requesting file...</title>
    </head>
    <body>   <%!public java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }%>
    
    
        <%Connection conn=null;
        Statement st =null;
        String uname = request.getParameter("username");
        String file = request.getParameter("file");
        Date dte = getCurrentDate();
        String size = request.getParameter("size");
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
try{
    conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
    st = conn.createStatement();
    ResultSet rs = st.executeQuery("select * from request where username = '"+uname+"' and filename ='"+file+"'");
    if(rs.next()){
        conn.close();
        response.sendRedirect("user.jsp?filter=.&msg="+request.getParameter("msg").toString()+"&username="+uname);
        out.print("<script>alert('the file requested already');</script>");
        
    }else{
        try {
                conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
                st = conn.createStatement();
                st.execute("insert into request(username,filename,size,date1, tstatus, astatus, skey) values('"+uname+"','"+file+"','"+size+"','"+dte+"','pending','pending','test')");
                out.print("<script>alert('requested successfully');</script>");
            } catch (Exception e) {
                out.print(e);
            }  
        conn.close();
    }
}catch(SQLException e){
    out.print(e);
}finally{
      //finally block used to close resources
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }
        
        %>
    </body>
</html>
