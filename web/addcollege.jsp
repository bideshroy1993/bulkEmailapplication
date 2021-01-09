<%-- 
    Document   : addcollege
    Created on : May 3, 2018, 2:42:36 PM
    Author     : Bidesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration of College</title>
        <script>
function validateForm() {
    var x = document.forms["newcollege"]["email"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Please enter a valid email id");
        return false;
    }
}
</script>
<style>
    body{
        margin: 0;
        padding: 0;
        background-image: url('img/addcollegeback.jpg');
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
        font-family: sans-serif;
    }
    h1{
        color:whitesmoke;
    }
    #reg{
        color: whitesmoke;
        background: rgba(0,0,0,0.5);
        width: 50%;
        margin-top:5%; 
    }
    #reg input{
        width: 90%;
        margin-bottom: 10px;
    }
    #reg input[type="text"]{
        border:none;
        border-bottom: 1px solid #fff;
        background: transparent;
        outline: none;
        color: #fff;
        font-size:16px;
        border-radius: 0 0 9px 9px;
        padding: 20px;
        
    }
    #reg input[type="submit"]{
        background-color: darkslategray;
        padding: 10px;
       // border-radius: 50% 0 0 50%;
       color: whitesmoke;
       font-size: 20px;
    }
    #reg input[type="submit"]:hover{
        background-color: tomato;
        color: black;
        cursor: pointer;
    }

    :-moz-placeholder{
        color: white;
    }
    :-ms-input-placeholder{
        color: white;
    }
    ::-webkit-input-placeholder{
        color: white;
    }
</style>
    </head>
    <body>
    <center>
        <div id="reg">    
        <form action="newcollege" method="post" onsubmit="return validateForm();">
                   <input type="text" name="cname" style="color: darksalmon"value="" placeholder="College Name" /><br>
                  <input type="text" name="email" value="" placeholder="Email"/><br>
                  <input type="text" name="webadd" value="" placeholder="Website"/><br>
                  <input type="text" name="pcperson" value=""  placeholder="Primary Contact Person"/><br>
                  <input type="text" name="pcpersondesignation" value="" placeholder="Primary Contact Person Designation"/><br>
                  <input type="text" name="pcpersonno" value="" placeholder="Primary Contact Person No."/><br>
                  <input type="text" name="scperson" value=""  placeholder="Secondary Contact Person"/><br>
                  <input type="text" name="scpersondesignation" value=""  placeholder="Secondary Contact Person Designation"/><br>
                 <input type="text" name="scpersonno" value="" placeholder="Secondary Contact Person No."/><br>
                 <input type="text" name="address" value=""  placeholder="College Address"/><br>
                 <input type="text" name="state" value=""  placeholder="College State"/><br>
                 <input type="submit" style="border-radius: 10px;width: 4cm;" value="Register" name="cregis" />
        </form>
        </div>
    </center>
    </body>
</html>
