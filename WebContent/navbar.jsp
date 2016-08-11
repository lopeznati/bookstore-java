<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
  <head>
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="assets/css/bootstrap.css" rel="stylesheet">
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    	<link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    	<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
    	<script src="assets/js/chart-master/Chart.js"></script>
  </head>
  <body>
  	<section id="container" >
    	<header class="header black-bg">
        	<div class="sidebar-toggle-box">
            	<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
            </div>
			<a href="inicio.jsp" class="logo"><b>The Open Book</b></a>
            <div class="nav notify-row" id="top_menu">
                <ul class="nav top-menu">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>                          
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">Carrito de compras</p>
                            </li>
                            <%if(session.getAttribute("carrito")!=null){
										ArrayList<Libro> carrito=(ArrayList<Libro>)session.getAttribute("carrito");		
										for(int i=0;i<carrito.size();i++){
										%>
                            <li>               
                                <div class="task-info go-center">           
                                     <a class="go-center" href="borracar.jsp?id=<%=i%>"><%=carrito.get(i).getTitulo() %> - $<%=carrito.get(i).getPrecio() %>
                                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                                     <input name="idlibro" type="hidden" id="idlibro" value="<%= carrito.get(i).getId() %>">  
                                     </a>                                      
                                </div>                                                                                                              
                            </li> 
                            	<%} %> 
                            <%} %>                       
                            <li class="external">
                                <a class="go-center" href="carrito.jsp">Ver Carrito completo</a>
                            </li>
                        </ul>
                    </li>
                    </ul>
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
            	<%if(session.getAttribute("usuario")==null){ %>
                    <li><a class="logout" href="login.jsp">Iniciar Sesión</a></li>     
                    <%} else{%>
                    <li><h5 class="centered acomodar">Hola, <%out.print(session.getAttribute("nombreUsuario")); %>!</h5></li>
                    <li><a class="logout" href="logout.jsp">Cerrar Sesión</a></li>  
                    <%} %>                  
            	</ul>
            </div>
        </header>
      </section>
   	</body>
 </html>