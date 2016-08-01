<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="negocio.ControladorAutor"%>
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
    <title>Actualizar libro</title>

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
      <jsp:include page="sidebarAdmin.html"></jsp:include>
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Modificar libro</h3>
          	<%Libro libro=new ControladorLibro().getOneLibro(Integer.parseInt(request.getParameter("idMod"))); %>
          	<!-- BASIC FORM ELELEMNTS -->
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
                                  <input type="text" name="isbn" class="form-control" value="<%=libro.getIsbn() %>" required>
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
                                  <input type="text" name="cpaginas" class="form-control" value="<%=libro.getCantidad_paginas()%>" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Numero Edicion</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="nedicion" value="<%=libro.getNumero_edicion() %>" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Precio</label>
                              <div class="col-sm-10">
                                  <input type="text" name="precio" class="form-control" value="<%=libro.getPrecio() %>" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Existencia</label>
                              <div class="col-sm-10">
                                  <input type="text" name="nexistencia" class="form-control" value="<%=libro.getExistencia() %>" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Editorial</label>
                              <div class="col-sm-10">
                                  <select name="editorial_id" class="form-control">
						  			<option>...</option>
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
                                  <select name="categoria_id" class="form-control">
									<option>...</option>
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
                                  <select name="autor_id" class="form-control">
						  			<option>...</option>
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
                          	<button class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Modificar</button>	
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

<!--     js placed at the end of the document so the pages load faster
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    common script for all pages
    <script src="assets/js/common-scripts.js"></script>

    script for this page
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	custom switch
	<script src="assets/js/bootstrap-switch.js"></script>
	
	custom tagsinput
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	custom checkbox & radio

	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets/js/form-component.js"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
  </script> -->
  		
	    <!--common script for all pages-->
    	<script src="assets/js/common-scripts.js"></script>

    	<!--script for this page-->
    	<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	
		<!--custom switch-->
		<script src="assets/js/bootstrap-switch.js"></script>
	
		<!--custom tagsinput-->
		<script src="assets/js/jquery.tagsinput.js"></script>
  </body>
</html>
