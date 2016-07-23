<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Carrito de compras</title>
		<!--  
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
		
		
		
		 <!-- Bootstrap core CSS -->
	    <link href="assets/css/bootstrap.css" rel="stylesheet">
	    <!--external css-->
	    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
	    <link href="assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
	    <!-- Custom styles for this template -->
	    <link href="assets/css/style.css" rel="stylesheet">
	    <link href="assets/css/style-responsive.css" rel="stylesheet">
	
	    <script src="assets/js/jquery.js"></script>
	
	
	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	  </head>

  <body>
	</head>
	<body>
	
	<section id="container white-backround" >
  
      <jsp:include page="navbar.jsp"></jsp:include>
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <jsp:include page="sidebar.jsp"></jsp:include>
      
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
	  	<section id="main-content">
          <section class="wrapper">  	
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          		<table class="table table-striped table-advance table-hover" border="0" cellspacing="0" cellpadding="0" align="center" >
									<tr bgcolor="#333333" class="tit"> 
										<td>Libro</td>
										<td>Categoria</td>
										<td>Editorial</td>
										<td>Precio</td>
										<td width="10" align="center">Borrar</td>
									</tr>
									<% 
										session.setAttribute("msj", " ");
										double total=0;
										int totalArticulos=0;
										if(session.getAttribute("carrito")!=null){
										ArrayList<Libro> carrito=(ArrayList<Libro>) session.getAttribute("carrito");
							
										for(int i=0;i<carrito.size();i++){
											total=total + carrito.get(i).getPrecio();
											totalArticulos+=1;
									%>
								<div> 
									<tr> 
										<td><%=carrito.get(i).getTitulo() %></td>
										<td><%=carrito.get(i).getCategoria().getDescripcion() %></td>
										<td><%=carrito.get(i).getEditorial().getNombre() %></td>
										<td><%=carrito.get(i).getPrecio() %></td>
										<td align="center"><a href="borracar.jsp?id=<%=i%>"><img src="imagenes/trash.gif" border="0"></a></td>
										<td><input name="idlibro" type="hidden" id="idlibro" value="<%= carrito.get(i).getId() %>"> </td>
									</tr>
									<%} %>
								</div>
								<%} %>
								</table>
								<br><br>
								<div align="center"><span >Total de Articulos:<%=totalArticulos %>
									</span> 
								</div><br>
								<div  align="center" id='total'><span >Total:$ <%=total %>
									</span> 
								</div><br>
								<% 
									if(total!=0){ %>
									
									<div  align="center">
										<span>Continuar la seleccion de productos</span>
										<a href="inicio.jsp">
										<img src="imagenes/continuar.gif" width="13" height="13" border="0"></a> 
									</div>
									<br>
									<div  align="center">
										<a href='comprar.jsp'>
										<input type="button" value="Iniciar compra" class='btn btn-primary'>
									</div>
									<%}
								else{ %>
									<p align="center"> 
										<span class="prod">No hay productos seleccionados</span>
										<a href="inicio.jsp">
										<img src="imagenes/continuar.gif" width="13" height="13" border="0"></a> 
									<%} %>
									</p>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
			</section><!--/wrapper -->
      	</section><!-- /MAIN CONTENT -->
	  	<jsp:include page="footer.html"></jsp:include>
	  	
	  	</section> 
	  	
	  	

        <!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</body>
</html>