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
      
      
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
	  	<section id="main-content">
          <section class="wrapper">  	
              <div class="row mt">
                  <div class="col-md-12">
                  <h4><i class="fa fa-angle-right"></i>Tu carrito</h4>
	              <hr>
                      <div class="content-panel">	                  	  	  
                              <table id="tabla" class="table table-striped">
              					<thead>
                					<tr>
                  						<th>Libro</th>
                  						<th>Categoría</th>
                 					 	<th>Editorial</th>
                 					 	<th>Precio</th>               					
                					</tr>
              					</thead>
                              <tbody>
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
                              <tr>
                                <td><%=carrito.get(i).getTitulo() %></td>
								<td><%=carrito.get(i).getCategoria().getDescripcion() %></td>
								<td><%=carrito.get(i).getEditorial().getNombre() %></td>
								<td><%=carrito.get(i).getPrecio() %></td>
								<td align="center"><a href="borracar.jsp?id=<%=i%>"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
								<td><input name="idlibro" type="hidden" id="idlibro" value="<%= carrito.get(i).getId() %>"> </td>
                              </tr>                    
                               <%} %>
                               <%} %>
                              </tbody>
                          </table>
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
										<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a> 
									</div>
									<br>
									<div  align="center">
									
									<a class="logout comprar nav top-menu" href="comprar.jsp">Iniciar Compra</a>
										
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
	  	
	  	
	  	</section> 
	  	<jsp:include page="footer.html"></jsp:include>
	  	

        <!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</body>
</html>