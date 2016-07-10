<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
    	<div class="col-md-12"></div>
  	</div>
  	<div class="row">
    	<div class="col-md-12"></div>
  	</div>
  	<div class="row">
  		<div class="col-md-4"></div>
  		
    	<%ControladorLibro catLibro = new ControladorLibro();
			ArrayList<Libro> libros = catLibro.getAllLibros();
		
		for (int i=0;i<libros.size();i++){
   				out.println("<div class='col-md-3'>");
   				out.println("<img src="+"'"+libros.get(i).getFoto()+"'"+"/>");
   				//+libros.get(i).getTitulo());
   				out.println("</div>");
   				if(i%3 == 0){
	   				out.println("<div class='row'>");
   				}
			}
			out.println("</div>");
		%>
			
</div>
  	
  	<div class="row">
  		<div class="col-md-12">
  			<h3>Aca va el footer</h3>
  		</div>
  	</div>
</div>



</body>
</html>