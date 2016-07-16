<%@page import="negocio.ControladorAutor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <%if(session.getAttribute("rolUsuario").equals("admin")){ %>

<% ControladorAutor ca=new ControladorAutor();
ca.bajaAutor(ca.getOneAutor(Integer.parseInt(request.getParameter("idElim"))));
response.sendRedirect("listadoAutor.jsp");

%>

		  	 	<%}else{
	  		response.sendRedirect("login.jsp");
	  	}%>


</body>
</html>