<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
</head>
<body>

<%if(session.getAttribute("rolUsuario").equals("admin")){ %>
<div class="row">
	    <div class="col-xs-12" align="center">
	    	<h2>Nuevo Autor</h2>
	    	
	    </div>
	   </div>

 <form action="AltaAutor" method="POST" >
		  <table class="table table-striped">
             
                <tr>
                  <td>Nombre</td>
                  <td><input type="text" name="nombre" required></td>
                </tr>
				
				<tr>
                  <td>Apellido</td>
                  <td><input type="text" name="apellido" required></td>
                </tr>
                <tr>
                  <td></td>
                  <td><input type="submit" class="btn btn-primary" value="Guardar"></td>
				  
	
                </tr>
				
				
				
           </table>
           
           </form>
         
  	 	<%}else{
	  		response.sendRedirect("login.jsp");
	  	}%>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>