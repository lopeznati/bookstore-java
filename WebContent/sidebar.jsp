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

<title></title>
</head>
<body>
<aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
            
              	  <p class="centered"><a href="inicio.jsp"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">The Open Book</h5> 
              	 <%if(session.getAttribute("usuario") != null){%>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                      	  <i class="fa fa-user" aria-hidden="true"></i>                          
                          <span>Mi Cuenta</span>
                      </a>                      
                      <ul class="sub">
                      	  	<li>
                      	  		<a href='modificarCliente.jsp?idMod=<%=session.getAttribute("usuario")%>'>
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Editar Datos</span>
                      	  		</a>
                      	  		 	<a href='listadoPedidosCliente.jsp?idCliente=<%=session.getAttribute("usuario")%>'>
                      	  			<i class="fa fa-book" aria-hidden="true"></i>                          
                          			<span>Mis Pedidos</span>
                      			</a>    
                      	  	</li>
                      </ul>
                  </li>
                  <%}%>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                      	  <i class="fa fa-book" aria-hidden="true"></i>                          
                          <span>Categorias</span>
                      </a>                      
                      <% ArrayList<Categoria> categorias = new ControladorLibro().getAllCategorias(); 
						for (Categoria c: categorias){%>
                      <ul class="sub">
                      	  <li>
                      	  		<a  href="categorias.jsp?idCat=<%=c.getId() %>"><%=c.getDescripcion()%></a>   
                      	  	</li>
                      </ul>
                        <%} %> 
                  </li>  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
     
   
</body>
</html>