<%-- 
    Document   : index
    Created on : 29 Oct, 2019, 9:58:00 PM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="libraries/p5.js" type="text/javascript"></script>
        <script src="libraries/p5.dom.js" type="text/javascript"></script>
        <script src="libraries/p5.sound.js" type="text/javascript"></script>
        <script src="js/sketch.js" type="text/javascript"></script>
        <script src="js/loginandsignup.js" type="text/javascript"></script>
        <style>
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

      .dropdown:hover .dropbtn {background-color: #03052e;}
      body {padding: 0; margin: 0;} canvas {position: absolute;top: 260px;}


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

#bt{
padding: 15px 10px;
margin: 8px 0 ;
border: 2px solid #EBDEF0;
border-radius: 5%;
}

#bt:hover {opacity: 0.4;}


#signtable{
width:70%;
border-radius: 25px;
background-color: #010337;
}


    </style>
    </head>

<body bgcolor="black" background="images/test.jpg">
    
        <div style="text-align:center">
            <a href="home.jsp" ><font face="timesnewroman" color="white" size="32"><h1>Home</h1></font></a>
            <br>

        </div>

        <table width="100%" >
            <tr align="center">
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>User</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('user','trustee','authority','cloud','reg')">login</a>
                            <a href="#" onclick="acc('reg','user','trustee','authority','cloud')">register</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>Trustee</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('trustee','user','authority','cloud','reg')">login</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>Authority</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('authority','trustee','user','cloud','reg')">login</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="dropbtn"><h1>Cloud</h1></button>
                        <div class="dropdown-content">
                            <a href="#" onclick="acc('cloud','trustee','user','authority','reg')">login</a>
                        </div>
                    </div>
                </td>
            </tr>
        </table><br><br>
    <div class="container" align="center" id="user" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="user" method ="get" action = "login.jsp">
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "uname" size ="40" maxlength ="70" required>
                <br>

                  <br>
                  <input type ="password" placeholder="enter password" name="upass" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30" required>
                  <br>
                  <input type="text"style="display:none;" name="utype" value="user">
                  <br> <br>
                  <input type = "submit"  id="bt" value ="login" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="bt" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/user.png" >
          </td>
        </tr>

    </table>
</div>


        <div class="container" align="center" id="trustee" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="trrustee" method ="get" action = "login.jsp" >
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "uname" size ="40" maxlength ="30" required>
                <br>

                  <br>
                  <input type ="password" placeholder="enter password" name="upass" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30" required>
                  <br>
                  <input type="hidden" name="utype" value="trustee">

                  <br> <br>
                  <input type = "submit"  id="bt" value ="login" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="bt" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/trustee.jpg" >
          </td>
        </tr>

    </table>
</div>



        <div class="container" align="center" id="authority" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="authorityform" method ="get" action = "login.jsp">
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "uname" size ="40" maxlength ="30" required>
                <br>

                  <br>
                  <input type ="password" placeholder="enter password" name="upass" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30" required>
                  <br>
                  <input type="hidden" name="utype" value="authority">
                                    <input type="hidden" name="status" value="">

                  <br> <br>
                  <input type = "submit"  id="bt" value ="login" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="bt" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/authority.jpeg" >
          </td>
        </tr>

    </table>
</div>


        <div class="container" align="center" id="cloud" style="text-align: center; display:none;">
      <table id="tableprop"cellpadding = "20">

        <tr style="border-radius: 5px;" >
          <td>
            <form name ="cloud form" method ="get" action = "login.jsp">
                <br>
                <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter Username" name = "uname" size ="40" maxlength ="30" required>
                <br>

                  <br>
                  <input type ="password" placeholder="enter password" name="upass" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30" required>
                  <br>
                  <input type="hidden" name="utype" value="cloud">
                  <br> <br>
                  <input type = "submit"  id="bt" value ="login" style="width: 80px; background: #13C133; color: white;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type ="reset"  id="bt" value = "Reset" style="width: 80px; background : #D04A4A; color:white;" > <br>

            </form>
          </td>
          <td style="border-radius: 25px;">
              <img id="image" src = "images/cloud.jpg" >
          </td>
        </tr>

    </table>
</div>
<div class="container" align="center" id="reg" style="text-align: center;display:none;">
    <table id="signtable"cellpadding = "20" align="center">

      <tr style="border-radius: 5px;" >
        <td>
          <form name ="signup" method ="get" action = "login.jsp">
            <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="First Name" name = "fname" size ="40" maxlength ="30"required>
            <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="Last Name" name = "lname" size ="40" maxlength ="30"required>


              <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter emailid" name = "uname" size ="40" maxlength ="30"required>

              <input type ="password" placeholder="enter new password" name="upass" style="border-radius: 5px;width: 200px;" id="box" size ="40" maxlength ="30"required>

              <input id="box" type ="text" style="width: 200px;border-radius: 5px;" placeholder="enter mobile number" name = "phone" size ="40" maxlength ="30" required>




                 <p style="color:white; font-size:24px;">Birth day    <input type="date" id="box"name="bday"></p>
                 <input type="hidden" name="utype" value="signup">
                <input type = "submit"  id="bt" value ="Signup" style="width: 80px; background: #13C133; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type ="reset"  id="bt" value = "Reset" style="width: 80px; background : #D04A4A; color:white;"> <br>

          </form>
        </td>
        <td style="border-radius: 25px;align:center; ">
          <h1 style="color:white;font-size:100px;">Sign<br> Up</h1><br><br>
        </td>
      </tr>

  </table>
</div>


</body>
</html>
