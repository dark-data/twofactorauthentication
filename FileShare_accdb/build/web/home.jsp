<%-- 
    Document   : home
    Created on : 29 Jun, 2019, 7:23:14 PM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FileShare</title>
        <script src="libraries/p5.js" type="text/javascript"></script>
        <script src="libraries/p5.dom.js" type="text/javascript"></script>
        <script src="libraries/p5.sound.js" type="text/javascript"></script>
        <script src="js/sketch2.js" type="text/javascript"></script>
        <script src="js/loginandsignup.js" type="text/javascript"></script>
        <style>
            canvas {position: absolute;top: 0px;}
            .dropbtn {
                background-color: #141640;
                color: white;
                padding: 0px 25px ;
                font-size: 16px;
                border: none;
                width:100%;
                min-width: 200px;
            }
            .dropdown {
                position: relative;
                display: inline-block;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 200px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown-content a:hover {background-color: #ddd;}
            .dropdown:hover .dropdown-content {display: block;}
            .dropdown:hover .dropbtn {background-color: #03052e; } 
            #box{
                padding: 15px 10px;
                margin: 8px 0 ;
                border: 2px solid #EBDEF0;
                border-radius: 5%;
            }
            button:hover {opacity: 0.4;}
            #image {
                border-radius: 5%;
                float: right;
            }
            .container {
                border-radius: 5px;
                padding: 56px;
            }
            #tableprop{
                width:450px;
                height: 400px;
                border-radius: 25px;
                background-color: #010337;  
                padding: 30px;
            }
            
            .para {
                font-family: Georgia, “Times New Roman”, Times, serif;
                font-size: 19px;
                font-style: italic;
                font-weight: bold;
                color: #010207;
            }
            p {
                font-family: Georgia, "Times New Roman", Times, serif;
                padding-top: 5px;
                padding-right: 0px;
                padding-bottom: 0px;
                padding-left: 5px;
            }
            #footer {
                font-family: Verdana, Geneva, sans-serif;
                font-size: 0.9em;
                font-weight: bold;
                color: #FFF;
                background-color: #666;
                padding: 10px;
                margin: 20px;
                height: auto;
                width: 90%;
                position: relative;
                bottom: 10px;
            }
        </style>
    </head>
    <body bgcolor="black" background="images/test.jpg">
        <div style="text-align:center">
            <a href="index.jsp" ><font face="timesnewroman" color="white" size="32">Home</font></a>
            <br>
        </div>
        <table width="100%" >
            <tr align="center">
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>User</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('user','trustee','authority','cloud')">login</a>
                            <a href="#" onclick="reguser()">register</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>Trustee</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('trustee','user','authority','cloud')">login</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>Authority</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('authority','trustee','user','cloud')">login</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>Cloud</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('cloud','trustee','user','authority')">login</a>
                        </div>
                    </div>
                </td>
            </tr>
        </table><br>
        <hr color="white">
 <center>
        <div class="container" align="center" id="user" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="trustee form" method ="get" action = "url">
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "Tname" size ="40" maxlength ="30">
                <br>

                  <br>
                  <input type =" password" placeholder="enter password" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30">
                  <br>
                  <br> <br>
                  <input type = "submit"  id="box" value ="submit" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="box" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/user.png" >
          </td>
        </tr>
        
    </table>
</div>
</center>
<center>        
        <div class="container" align="center" id="trustee" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="trustee form" method ="get" action = "url">
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "Tname" size ="40" maxlength ="30">
                <br>

                  <br>
                  <input type =" password" placeholder="enter password" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30">
                  <br>
                  <br> <br>
                  <input type = "submit"  id="box" value ="submit" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="box" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/trustee.jpg" >
          </td>
        </tr>
        
    </table>
</div>
</center>
  <center>      
        
        <div class="container" align="center" id="authority" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="trustee form" method ="get" action = "url">
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "Tname" size ="40" maxlength ="30">
                <br>

                  <br>
                  <input type =" password" placeholder="enter password" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30">
                  <br>
                  <br> <br>
                  <input type = "submit"  id="box" value ="submit" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="box" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/authority.jpeg" >
          </td>
        </tr>
        
    </table>
</div>
</center>
    <center>
        
        <div class="container" align="center" id="cloud" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20" lign="center">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="trustee form" method ="get" action = "url">
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "Tname" size ="40" maxlength ="30">
                <br>

                  <br>
                  <input type =" password" placeholder="enter password" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30">
                  <br>
                  <br> <br>
                  <input type = "submit"  id="box" value ="submit" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="box" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/cloud.jpg" >
          </td>
        </tr>
        
    </table>
</div>
        
        </center>
    <center><p class="para container" style="    width:90%;   height: auto;    border-radius: 5px;    background-color: #f2f2f2;    padding: 30px;">In this paper, we introduce a new fine-grained two-factor authentication (2FA) access control system for web-based cloud computing services. Specifically, in our proposed 2FA access control system, an attribute-based access control mechanism is implemented with the necessity of both a user secret key and a lightweight security device. As a user cannot access the system if they do not hold both, the mechanism can enhance the security of the system, especially in those scenarios where many users share the same computer for web-based cloud services. In addition, attribute-based control in the system also enables the cloud server to restrict the access to those users with the same set of attributes while preserving user privacy, i.e., the cloud server only knows that the user fulfils the required predicate, but has no idea on the exact identity of the user. Finally, we also carry out a simulation to demonstrate the practicability of our proposed 2FA system.<br/><br/><br/></p>   <br/><br/>
        <p id="footer">Tech Knights</p></center>
    </body>
</html>
