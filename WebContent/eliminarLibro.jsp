<%@page import="entidades.Libro"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>

<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Baja Libros</title>
	</head>
	<body>
		<%if(session.getAttribute("rolUsuario").equals("admin")){ %>
  		<section id="container" >
      	<jsp:include page="navbar.jsp"></jsp:include>
      
      	<!-- **********************************************************************************************************************************************************
      	MAIN SIDEBAR MENU
      	*********************************************************************************************************************************************************** -->
      	<jsp:include page="sidebarAdmin.html"></jsp:include>
      
      	<!-- **********************************************************************************************************************************************************
      	MAIN CONTENT
      	*********************************************************************************************************************************************************** -->
      	<!--main content start-->
      	<section id="main-content">
        	<section class="wrapper">
          		<h3><i class="fa fa-angle-right"></i>Eliminar Libro</h3>
				<% ControladorLibro cl=new ControladorLibro();
	   	   		Libro l = cl.getOneLibro(Integer.parseInt(request.getParameter("idElim")));
	   	   		System.out.println(l.getId());
	   			%>
				<!-- BASIC FORM ELELEMNTS -->
          		<div class="row mt">
	          		<div class="col-lg-12">
    	    	    	<div class="form-panel">
 							<form class="form-horizontal style-form" action="eliminarLibro" method="POST">
 								<div class="form-group">
                            		<label class="col-sm-2 col-sm-2 control-label">ID</label>
	                              	<div class="col-sm-10">  
	                              		<input readonly type="text" name="id" value="<%=l.getId()%>" class="form-control">
				 	                </div>
            	              	</div> 
								<div class="form-group">
                            		<label class="col-sm-2 col-sm-2 control-label">ISBN</label>
	                              	<div class="col-sm-10">             	              	
										<input readonly type="text" name="isbn" value="<%=l.getIsbn()%>" class="form-control">
									</div>
            	              	</div> 
								<div class="form-group">
                            		<label class="col-sm-2 col-sm-2 control-label">Titulo</label>
	                              	<div class="col-sm-10">             	              	
										<input readonly type="text" name="titulo" value="<%=l.getTitulo()%>" class="form-control">
									</div>
            	              	</div> 
								<div class="form-group">
                            		<label class="col-sm-2 col-sm-2 control-label">Número de edición</label>
	                              	<div class="col-sm-10">             	              	
										<input readonly type="text" name="numero_edicion" value="<%=l.getNumero_edicion()%>" class="form-control">
									</div>
            	              	</div> 
								<div class="form-group">
                            		<label class="col-sm-2 col-sm-2 control-label">Editorial</label>
	                              	<div class="col-sm-10">             	              	
										<input readonly type="text" name="editorial" value="<%=l.getEditorial().getNombre()%>" class="form-control">
									</div>
            	              	</div> 
								<div class="form-group">
                            		<label class="col-sm-2 col-sm-2 control-label">Categoria</label>
	                              	<div class="col-sm-10">             	              	
										<input readonly type="text" name="categoria" value="<%=l.getCategoria().getDescripcion()%>" class="form-control">
									</div>
            	              	</div>             	              	            	              	            	              	            	           
								<div class="form-group">
                            		<label class="col-sm-2 col-sm-2 control-label">Autor</label>
	                              	<div class="col-sm-10">  
	                              		<% %>           	              	
										<input readonly type="text" name="autor" value="<%=l.getAutor().getApellido().concat(", " + l.getAutor().getNombre())%>" class="form-control">
									</div>
            	              	</div>       			
            					<div class="centrar-cont">
              						<input type="submit" class="btn btn-primary" value="Eliminar">
              						<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='listadoLibros.jsp'">	
            					</div>
						</form>
              		</div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->       
     		 <!--footer start-->
       		<jsp:include page="footer.html"></jsp:include>
      		<!--footer end-->
  		</section>
		 	<%}else{
	  			response.sendRedirect("login.jsp");
	  		}%>
	  			
      <!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   		<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
    	<!-- js placed at the end of the document so the pages load faster -->
    	<script src="assets/js/jquery.js"></script>
    	<script src="assets/js/jquery-1.8.3.min.js"></script>
    	<script src="assets/js/bootstrap.min.js"></script>
    	<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    	<script src="assets/js/jquery.scrollTo.min.js"></script>
    	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    	<script src="assets/js/jquery.sparkline.js"></script>


    	<!--common script for all pages-->
    	<script src="assets/js/common-scripts.js"></script>
    
    	<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    	<!--script for this page-->
    	<script src="assets/js/sparkline-chart.js"></script> 
	</body>
</html>