<%@page import="negocio.ControladorAutor"%>
<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Autor"%>
<%@page import="entidades.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Editorial"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Alta Libro</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<%if(session.getAttribute("rolUsuario").equals("admin")){ %>

  	  <section id="container" >
      <jsp:include page="navbar.jsp"></jsp:include>
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <jsp:include page="sidebarAdmin.jsp"></jsp:include>
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Agregar un libro</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Completar el formulario</h4>
                      <form class="form-horizontal style-form" action="altaLibro" method="POST">
                      	 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Imagen</label>
                              <div class="col-sm-10">
                                  <input type="url" name="foto" required class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">ISBN</label>
                              <div class="col-sm-10">
                                  <input type="text" name="isbn" id="isbn" required class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Titulo</label>
                              <div class="col-sm-10">
                                  <input type="text" name="titulo" required class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Sipnosis</label>
                              <div class="col-sm-10">
                                  <textarea rows="8" cols="50" name="sipnosis" required class="form-control"></textarea>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Cantidad de Paginas</label>
                              <div class="col-sm-10">
                                  <input type="text" name="cpaginas" id="cpaginas" required class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Numero Edicion</label>
                              <div class="col-sm-10">
                                  <input type="text" name="nedicion" id="nedicion" required class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Precio</label>
                              <div class="col-sm-10">
                                  <input type="text" name="precio" id="precio" required class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Existencia</label>
                              <div class="col-sm-10">
                                  <input type="text" name="nexistencia" id="nexistencia" required class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Editorial</label>
                              <div class="col-sm-10">
                                  <select name="editorial_id" id="editorial_id" class="form-control">
						  			<option value="" selected="selected">...</option>
						  			<%
						  			ArrayList<Editorial> editoriales = new ControladorLibro().getAllEditoriales();
										for(Editorial e:editoriales){%>
						  			<option value="<%=e.getId()%>"><%=e.getNombre()%></option>
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
										for(Categoria c:categorias){%>
									<option value="<%=c.getId()%>"><%=c.getDescripcion()%></option>
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
										for(Autor a:autores){%>
						  			<option value="<%=a.getId()%>"><%=a.getNombre() + ' ' + a.getApellido()%></option>
						  			<%} %>						  			
								</select>
                              </div>
                          </div>
                          <div class="centrar-cont">
                          	<button type="submit" id="agregar" class="btn btn-primary" >Agregar</button>	
                          	<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='inicioAdmin.jsp'">	
                          </div>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->       
 		<jsp:include page="footer.html"></jsp:include>
  		</section>
  		<%}
  			else{
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
	  					alert("El campo Número de Edicion ingresado debe ser un numero");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}
	  				
	  				var precio=$("#precio").val();
	  				precio =parseFloat(precio);
	  				if(isNaN(precio)){
	  					alert("El campo Precio ingresado debe ser un numero o decimal");	  
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
	  					alert("El campo Editorial no puede quedar vacio, seleccione una opcion.");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}	  				
	  				var categoria=$("#categoria_id").val();
	  				if(categoria === ''){
	  					alert("El campo Categoria no puede quedar vacio, seleccione una opcion.");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}	  
	  				
	  				var autor=$("#autor_id").val();
	  				if(autor === ''){
	  					alert("El campo Autor no puede quedar vacio, seleccione una opcion.");	  
	  				//cancela el evento
	   					event.preventDefault();
	  				}
	  			});
   			});
	  		</script>

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
