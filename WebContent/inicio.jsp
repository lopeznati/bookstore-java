<%@page import="negocio.ControladorCategoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="entidades.Categoria" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/styles.css" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Hammersmith+One' rel='stylesheet' type='text/css'>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<jsp:include page="navbar.html" flush="true" />
	<div class="row">
        <div class="col-xs-12"></div>
    </div>
    <div class="row">
        <div class="col-xs-12"><h2>BookStore</h2></div>
    </div>
    <div class="row">
        <div class="col-md-4">
        	<ul>
			<% ArrayList<Categoria> categorias = new ControladorCategoria().getAllCategorias(); 
				for (Categoria c: categorias){%>
				<li><a href="#"><%=c.getDescripcion()%></a></li>
				<%} %>
				</ul>
		</div>		
 	</div>
 	
  	<div class="row">
  		<div class="col-lg-3 col-md-8 col-sm-6 col-xs-12">
  		
  			<ul>
  			<%ArrayList<Libro> libros = new ControladorLibro().getAllLibros();
        		int cont = 3;
 				for (Libro l: libros){
 				if(cont%3 == 0){%>
 				
 				<li class="hovereffect acomodarse">
 					<img class="img-responsive " src="<%=l.getFoto()%>"/>
 					<div class="overlay">
           				<h2><%=l.getTitulo()%><br>$<%=l.getPrecio()%></h2>
           				<a class="info" href="#">Detalles</a>
        			</div>
 				</li>
 				<%}} %>
 			</ul>
 		</div>
  		</div>
  	
  	
	<jsp:include page="footer.html" flush="true" />		
</div>
  	
  	




</body>
</html>