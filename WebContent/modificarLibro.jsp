<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="negocio.ControladorAutor"%>
<%@page import="entidades.Autor"%>
<%@page import="entidades.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Editorial"%>

<!DOCTYPE html>
<html>
	<head>
  		<meta charset="utf-8">
    	<title>Actualizar libro</title>

    	<link href="assets/css/bootstrap.css" rel="stylesheet">
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
  	</head>
	<body>
  		<%if(session.getAttribute("rolUsuario").equals("admin")){ %>
  		<section id="container" >
      		<jsp:include page="navbar.jsp"></jsp:include>
      		<jsp:include page="sidebarAdmin.jsp"></jsp:include>
      		<section id="main-content">
          		<section class="wrapper">
          			<h3><i class="fa fa-angle-right"></i>Modificar libro</h3>
          			<%Libro libro=new ControladorLibro().getOneLibro(Integer.parseInt(request.getParameter("idMod"))); %>
          			<div class="row mt">
          				<div class="col-lg-12">
                  			<div class="form-panel">
                  	  			<h4 class="mb"><i class="fa fa-angle-right"></i> Completar el formulario</h4>
                      			<form class="form-horizontal style-form" action="modificarLibro" method="POST">                     	 
					  	  			<div class="form-group">
                        				<label class="col-sm-2 col-sm-2 control-label">ID</label>
                            			<div class="col-sm-10">
                            				<input READONLY type="text" name="id" value="<%=libro.getId()%>" class="form-control">
                             			</div>
                          			</div>  
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Foto</label>
                              			<div class="col-sm-10">
                                  			<input type="text" class="form-control" value="<%=libro.getFoto() %>" name="foto"> 
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">ISBN</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="isbn" id="isbn" class="form-control" value="<%=libro.getIsbn() %>" required>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Titulo</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="titulo" class="form-control" value="<%=libro.getTitulo() %>" required>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Sipnosis</label>
                              			<div class="col-sm-10">
                                  			<textarea rows="8" cols="50" name="sipnosis" class="form-control" required><%=libro.getSipnosis() %></textarea>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Cantidad de Paginas</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="cpaginas" id="cpaginas" class="form-control" value="<%=libro.getCantidad_paginas()%>" required>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Numero Edicion</label>
                              			<div class="col-sm-10">
                                  			<input type="text" class="form-control" name="nedicion" id="nedicion" value="<%=libro.getNumero_edicion() %>" required>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Precio</label>
                              			<div class="col-sm-10">
		                                  	<input type="text" name="precio" id="precio" class="form-control" value="<%=libro.getPrecio() %>" required>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Existencia</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="nexistencia" id="nexistencia" class="form-control" value="<%=libro.getExistencia() %>" required>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Editorial</label>
                              			<div class="col-sm-10">
                                  			<select name="editorial_id" id="editorial_id" class="form-control">
						  						<option value="" selected="selected">...</option>
						  						<%String sel;
												ArrayList<Editorial> editoriales=new ControladorLibro().getAllEditoriales();
												for(Editorial e:editoriales){
													if(e.getId()==libro.getEditorial().getId()){
														sel="selected";
													}else sel="";%>
						  						<option <%=sel %> value="<%=e.getId()%>"><%=e.getNombre()%></option>
						  						<%} %>						  			
											</select>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Categorias</label>
                              			<div class="col-sm-10">
                                  			<select name="categoria_id" id="categoria_id" class="form-control">
												<option value="" selected="selected">...</option>
												<%ArrayList<Categoria> categorias=new ControladorLibro().getAllCategorias();
												for(Categoria c:categorias){	
													if(c.getId()==libro.getCategoria().getId()){
														sel="selected";
													}else sel="";%>
												<option <%=sel %> value="<%=c.getId()%>"><%=c.getDescripcion()%></option>
												<%}%>
											</select>
                              			</div>
                          			</div>
                           			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Autor</label>
                              			<div class="col-sm-10">
                                  			<select name="autor_id" id="autor_id" class="form-control">
						  						<option value="" selected="selected">...</option>
						  						<%ArrayList<Autor> autores=new ControladorAutor().getAllAutores();
												for(Autor a:autores){
													if(a.getId()==libro.getAutor().getId()){
														sel="selected";
													}else sel="";%>
						  						<option <%=sel %> value="<%=a.getId()%>"><%=a.getNombre() + ' ' + a.getApellido()%></option>
												<%} %>						  			
											</select>
                              			</div>	
                          			</div>
                          			<div class="centrar-cont">
                          				<button class="btn btn-primary">Modificar</button>	
                          				<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='listadoLibros.jsp'">	
                          			</div>                          
                      			</form>
                  			</div>
          				</div>  	
          			</div>
          		</section>
          	</section>      
  		</section>
  	 	<%}else{
	  		response.sendRedirect("login.jsp");
	  	}%>
		<script src="assets/js/jquery.js"></script>
	  	<script type="text/javascript">
	  		$(document).ready(function(){
	  			$("form").submit(function(event){
	  				var isbn=$("#isbn").val();
	  				isbn =parseInt(isbn);
	  				if(isNaN(isbn)){
	  					alert("El campo ISBN ingresado debe ser un numero");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}
	  				var cantidad=$("#cpaginas").val();
	  				cantidad =parseInt(cantidad);
	  				if(isNaN(cantidad)){
	  					alert("El campo Cantidad de Paginas ingresado debe ser un numero");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}
	  				
	  				var nro_edicion=$("#nedicion").val();
	  				nro_edicion =parseInt(nro_edicion);
	  				if(isNaN(nro_edicion)){
	  					alert("El campo N�mero de Edicion ingresado debe ser un numero");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}
	  				
	  				var precio=$("#precio").val();
	  				precio =parseFloat(precio);
	  				if(isNaN(precio)){
	  					alert("El campo Precio ingresado debe ser un numero o un decimal");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}
	  				
	  				var existencia=$("#nexistencia").val();
	  				existencia =parseInt(existencia);
	  				if(isNaN(existencia)){
	  					alert("El campo Existencia ingresado debe ser un numero");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}
	  				var editorial=$("#editorial_id").val();
	  				if(editorial === ''){
	  					alert("l campo Editorial no puede quedar vacio, seleccione una opcion.");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}	  				
	  				var categoria=$("#categoria_id").val();
	  				if(categoria === ''){
	  					alert("El campo Categoria no puede quedar vacio, seleccione una opcion.");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}	  
	  				
	  				var categoria=$("#autor_id").val();
	  				if(categoria === ''){
	  					alert("El campo Autor no puede quedar vacio, seleccione una opcion.");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}	 
	  			});
   			});
	  		</script>
   			<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    		<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
    		<script src="assets/js/jquery.js"></script>
    		<script src="assets/js/jquery-1.8.3.min.js"></script>
    		<script src="assets/js/bootstrap.min.js"></script>
    		<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    		<script src="assets/js/jquery.scrollTo.min.js"></script>
    		<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    		<script src="assets/js/jquery.sparkline.js"></script>
    		<script src="assets/js/common-scripts.js"></script>
    		<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    		<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
    		<script src="assets/js/sparkline-chart.js"></script> 
  	</body>
</html>
