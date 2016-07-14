<%@page import="negocio.ControladorLibro"%>
<%@page import="datos.CatalogoCliente"%>
<%@page import="datos.CatalogoLibro"%>
<%@page import="datos.CatalogoLocalidad"%>
<%@page import="entidades.Localidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.ControladorCliente"%>
<%@page import="entidades.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Actualizar Cliente</title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
	</head>
	<body>
		<%Cliente cliente = new ControladorCliente().getOneCliente(Integer.parseInt(request.getParameter("idMod")));%>
		<div class="row">
		    <div class="col-xs-12" align="center">
		    	<h2>Modificar Cliente</h2>
	    	</div>
		</div>
 		<form action="modificarCliente" method="POST" >
			<table class="table table-striped">
              	<tr>
                	<td><input type="hidden" name="id" value="<%=cliente.getId() %>"required></td>
                </tr>
                <tr>
                  	<td>Usuario</td>
                  	<td><input type="text" name="nombre" value="<%=cliente.getUsuario() %>"required></td>
                </tr>
				<tr>
                  	<td>Clave</td>
                  	<td><input type="text" name="apellido" value="<%=cliente.getClave() %>" required></td>
                </tr>
                <tr>
                  	<td>Nombre</td>
                  	<td><input type="text" name="nombre" value="<%=cliente.getNombre() %>"required></td>
                </tr>
				<tr>
                  	<td>Apellido</td>
                  	<td><input type="text" name="apellido" value="<%=cliente.getApellido()%>" required></td>
                </tr>
                				<tr>
                  	<td>Fecha Nacimiento</td>
                  	<td><input type="text" name="fecha_nacimiento" value="<%=cliente.getFecha_nacimiento() %>" required></td>
                </tr>
               	<tr>
                  	<td>Telefono</td>
                  	<td><input type="text" name="telefono" value="<%=cliente.getTelefono() %>" required></td>
                </tr>
                <tr>
                  	<td>Mail</td>
                  	<td><input type="text" name="mail" value="<%=cliente.getMail()%>" required></td>
                </tr>
                <tr>
                  	<td>Dirección</td>
                  	<td><input type="text" name="direccion" value="<%=cliente.getDireccion() %>" required></td>
                </tr>
                <tr>
                  	<td>Foto</td>
                  	<td><input type="text" name="foto" value="<%=cliente.getFoto() %>" required></td>
                </tr>
                <tr>
                  	<td>Rol</td>
                  	<td><input type="text" name="rol" value="<%=cliente.getRol()%>" required></td>
                </tr>
 				<tr>
                  	<td>Localidad</td>
              		<td>
                        <select name="id_localidad">
						  	<option>...</option>
						  	<% ArrayList<Localidad> localidades = new ControladorCliente().getAllLocalidades();
							   for(Localidad l:localidades){%>
						  		<option value="<%=l.getId()%>"><%=l.getNombre()%></option>
									<%} %>						  			
						</select>
					</td>
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