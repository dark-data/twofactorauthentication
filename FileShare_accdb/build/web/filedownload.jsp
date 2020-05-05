<%-- 
    Document   : filedownload
    Created on : 12 Jul, 2019, 2:01:48 PM
    Author     : vivek
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        #box{
padding: 15px 10px;
margin: 8px 0 ;
border: 2px solid #EBDEF0;
border-radius: 5%;
}

button:hover {opacity: 0.4;}

.container {
  border-radius: 5px;
  padding: 56px;
}

#bt{
padding: 15px 10px;
margin: 8px 0 ;
border: 2px solid #EBDEF0;
border-radius: 5%;
}

#bt:hover {opacity: 0.4;}

</style>
<body style="background-color: wheat;">
        <%
            String file = request.getParameter("file");
            String usernme = request.getParameter("username");
            String size = request.getParameter("size");
        %>
        <div class="container" align="center" style=" border-top: 5px solid;border-top-color: #EEEEFF;background-color: burlywood;text-align: center;">
            <form name ="filedownload" method ="get" style="border-color: brown; padding: 0px 0px 50px 5px ;border: 5px solid;" action = "download.jsp">
                <h1 style="color: aliceblue; ">Access Validation</h1><br/>
            <label><b>File Name:  <% out.print("  "+file+"   ("+size+").</b>"); out.print("<input type = 'hidden' name = 'file' value='"+file+"'>");out.print("<input type = 'hidden' name = 'user' value='"+usernme+"'>");out.print("<input type = 'hidden' name = 'msg' value='"+request.getParameter("msg")+"'>"); %></label><br>
            <br/><br/><br/><br/><br/><input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter the key provided" name = "key" size ="40" maxlength ="30"required>
            <input type = "submit"  id="bt" value ="continue to download" style="width: 180px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                

          </form>
            </div>
    </body>
</html>
