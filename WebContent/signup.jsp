<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<link href="css/styles.css" rel="stylesheet" >

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>Registro</title>
</head>
<body class="body">  

<div class="container" >
    <div class="col-md-6" >
        <div id="logbox"  >
            <form id="signup" method="post" action="/signup" >
                <h1>Crear una cuenta</h1>
                	FALTA LA FOTO
                	FALTA FECHA NACIMIENTO
                	FALTA DDIRECCION
                	<input name="user[nombre]" type="text" placeholder="Nombre" class="input pass"/>
                	<input name="user[apellido]" type="text" placeholder="Apellido" class="input pass"/>
                	<input name="user[telefono]" type="number" placeholder="(011) - 12345678" class="input pass"/>
				 	<input name="user[email]" type="email" placeholder="Email" class="input pass"/>
				 	<input name="user[localidad]" type="text" placeholder="Localidad" class="input pass"/>
                	<input name="user[clave]" type="password" placeholder="Elija una clave" required="required" class="input pass"/>
                	<input name="user[clave2]" type="password" placeholder="Confirme la clave" required="required" class="input pass"/>
                	<label for="">Fecha de Nacimiento</label>
            			<div class="row">
                			<div class="col-xs-4 col-md-4">
                    			<select class="form-control">
                        			<option value="Month">Month</option>
                   				</select>
                			</div>
                		<div class="col-xs-4 col-md-4">
                    			<select class="form-control">
                        			<option value="Day">Day</option>
                    			</select>
                		</div>
                			<div class="col-xs-4 col-md-4">
                    			<select class="form-control">
                        			<option value="Year">Year</option>
                    			</select>
                			</div>
            			</div>
                	<input type="submit" value="Registrarme!" class="inputButton"/>

            </form>
        </div>
    </div>
    <!--col-md-6-->


</div>
     
	
</body>
</html>