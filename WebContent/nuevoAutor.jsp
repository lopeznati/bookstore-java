<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
</head>
<body>

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


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>