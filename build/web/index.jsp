

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link href="js/bootstrap.min.js">
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
             $('.search').on('keyup',function(){
                 var searchTerm = $(this).val().toLowerCase();
                 $('#tdata tbody tr').each(function(){
                     var lineStr=$(this).text().toLowerCase();
                     if(lineStr.indexOf(searchTerm)===-1){
                         $(this).hide();
                     }else{
                         $(this).show();
                     }
                 });
             });   
            });
        </script>
        <script>
            $(function(){

	// add multiple select / deselect functionality
	$("#selectall").click(function () {
		  $('.names').attr('checked', this.checked);
	});

	// if all checkbox are selected, check the selectall checkbox
	// and viceversa
	$(".names").click(function(){

		if($(".names").length == $(".names:checked").length) {
			$("#selectall").attr("checked", "checked");
		} else {
			$("#selectall").removeAttr("checked");
		}

	});
});
        </script>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
  <style>
      body{
          margin: 0;
          padding: 0;
          font-family: sans-serif;
      }
      #search{
          float:right;
      }
      #search input{
          font-size: 20px;
          padding: 10px;
      }
      #tdata{
          margin-top: 5%;
      }
      #main{
          height: 100%;
          width: 100%;
      }
     // header{
       //   width: 100%;
       //   height: 150px;
       //   background-color: red;
     // }
     #logo{
          width: 100%;
         height: 200px;
      }
      #logo img{
          height: 150px;
          width: 150px;
      }
      #menu{
          width: 100%;
      }
      #menu ul{
          list-style: none;
          height: 50px;
          width: 100%;
      }
      #menu ul li{
          float: left;
          width: 50%;
          background-color: royalblue;
      }
  </style>
</head>
    
    <body>
        <div id="main">
            <header>
                <div id="logo"><center><img src="img/pcslogo.png"></center></div>
                <div id="menu">
                    <ul>
                        <li><center>Mail Send</center></li>
                    <li><center>College Registration</center></li>
                    </ul>
                </div>
            </header>
        <div id="search">
            <input type="text" class="from-control search" placeholder="What you are looking for">
        </div>
        <br>
        <br>
        <form action="SendMail" method="post" enctype="multipart/form-data">
            <h1>Compose Mail</h1>
     <table id="tdata" border="1">
       <thead>
         <tr>
            <th><input type="checkbox" id="selectall">All</th>
            <th>College ID</th>
            <th>College Name</th>
            <th>Email</th>
            <th>Website</th>
            <th>Primary Person</th>
            <th>Primary Person Designation</th>
            <th>Primary Person No.</th>
            <th>Secondary Person</th>
            <th>Secondary Person Designation</th>
            <th>Secondary Person No.</th>
            <th>Address</th>
            <th>State</th>
      </tr> 
                  </thead>
            <%
    Connection conn=null;
    Statement st=null;
    ResultSet rs=null;
    try{
    Class.forName("com.mysql.jdbc.Driver");
    conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/collegeinfo", "root", "");
    st=conn.createStatement();
    String qry="select * from collegedetails";
    rs=st.executeQuery(qry);
    while(rs.next()){
    %>
    <tbody>
    <tr>
        <td><input class="names" name="names" value=<%= rs.getString(3) %> type="checkbox"></td>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td>
        <td><%= rs.getString(8) %></td>
        <td><%= rs.getString(9) %></td>
        <td><%= rs.getString(10) %></td>
        <td><%= rs.getString(11) %></td>
        <td><%= rs.getString(12) %></td>
    </tr>
    </tbody>
    <%
    }
    }
    catch(Exception ex){}
    %>
    </table> 
    <br><br>
Subject:<input type="text" name="subject"><br><br>
Text:<textarea rows="10" cols="70" name="msg"></textarea><br/><br/>
Attach File<input type="file" name="file" size="50" />
<input type="submit" value="send">
        </form>
<h3><a href="addcollege.jsp">Click Here</a> to add new college</h3>
</div>
</body>
</html>
