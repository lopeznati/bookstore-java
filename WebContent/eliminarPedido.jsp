<%@page import="negocio.ControladorPedido"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Baja pedido</title>
</head>
<body>
 <%if(session.getAttribute("rolUsuario").equals("admin")){ %>

	<% 
		ControladorPedido cp=new ControladorPedido();
		cp.bajaPedido(cp.getOnePedido(Integer.parseInt(request.getParameter("idElim"))));	
		response.sendRedirect("listadoPedido.jsp");
	%>
	<%}else{
		  		response.sendRedirect("login.jsp");
	  		}
	%>

</body>
</html>