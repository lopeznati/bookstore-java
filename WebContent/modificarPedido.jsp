<%@page import="negocio.ControladorPedido"%>
<%@page import="entidades.Pedido"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Actualizar pedido</title>
	</head>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
	
	<body>
		<%if(session.getAttribute("rolUsuario").equals("admin")){ %>

		<%Pedido pedido=new ControladorPedido().getOnePedido(Integer.parseInt(request.getParameter("idMod"))); %>

		<div class="row">
		    <div class="col-xs-12" align="center">
		    	<h2>Modificar Pedido</h2>
	    	</div>
		</div>
 		<form action="modificarPedido" method="POST" >
			<table class="table table-striped">
              	<tr>
                	<td><input type="hidden" name="id" value="<%=pedido.getId() %>" required></td>
                </tr>
				<tr>
                  	<td>Libro</td>
                  	<td><input type="text" name="apellido" value="<%=pedido.getLibro().getTitulo()%>" required></td>
                </tr>
                <tr>
                  	<td>Fecha Pedido</td>
                  	<td><input type="text" name="fecha_pedido" value="<%=pedido.getFecha_pedido()%>" required></td>
                </tr>
                <tr>
                	<td>Direccion</td>
                  	<td><input type="text" name="direccion" value="<%=pedido.getDireccion()%>" required></td>
                </tr>
                <tr>
                    <td>Localidad</td>
                  	<td><input type="text" name="subtotal" value="<%=pedido.getLocalidad()%>" required></td>
                </tr>
                <tr>
                    <td>Tarjeta</td>
                  	<td><input type="text" name="tarjeta" value="<%=pedido.getTarjeta().getTipo_tarjeta().getNombre()%>" required></td>
                </tr>
                <tr>
                    <td>Subtotal</td>
                  	<td><input type="text" name="subtotal" value="<%=pedido.getSubtotal()%>" required></td>
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