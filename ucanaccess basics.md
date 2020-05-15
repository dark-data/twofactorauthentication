# UCANACCES.JAR > JAVA WEB APPLICATION 
- (RIGHT + CLICK) libraries under project
- add MySQL-JDBC Driver
- download latest version of ucanaccess and other dependencies from [ucanaccess.sourceforge.net](http://ucanaccess.sourceforge.net/site.html)
- import all the jar files to the project 
- once imported its all done
create database using MS Access and save the file under PROJECT-FOLDER/web/ dir.
## To connect and load the database file

**Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");**
**Connection con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/DB_NAME.accdb");**
    
## SELECT Statement
```
try{
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
    Connection con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/emis.accdb");
    PreparedStatement ps= con.prepareStatement("select * from student WHERE standard=?");// omg it's STUDENT -database
    ps.setString(1,"1");
    ResultSet rs = ps.executeQuery();
    out.print("<table><thead><tr><th>name</th><th>gender</th><th>phone</th><th>email</th></tr></thead><tbody>")
    while(rs.next()){
        out.println("<tr><td>" + rs.getString("fname") + "</td><td>" + rs.getString("gender") + "</td>");
        out.println("<td>" + rs.getString("phone") + "</td><td>"+ rs.getString("email") +"</td></tr>");       
    }con.close(); 
    out.println("</tbody></table>");
}catch(Exception e){
    out.print(e);
}
```
## INSERT Statement
```
<%! 
Connection con;
PreparedStatement ps;
String fnme, lnme, username, psw, phone;
%>
<%
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
fnme = request.getParameter("fname");
lnme = request.getParameter("lname");
phone = request.getParameter("phone");
username = request.getParameter("uname"); 
psw =request.getParameter("upass");
try {
    Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
    Statement st = conn.createStatement();
    st.execute("insert into useraccounts(fname,lname,username,password, email, phone) values('"+fnme+"','"+lnme+"','"+username+"','"+psw+"','"+username+"','"+phone+"')");
    out.print("<script>alert('registered successfully');</script>");
    con.close();
    %>
    <jsp:include page="index.jsp"></jsp:include>
    <%
} catch (Exception e) {
    System.out.print(e);
}
%>
```
