rolUsuario<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>In
</title>
</head>
<body>
<!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="inicioAdmin.jsp"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">The Open Book</h5>

                  <li class="sub-menu">
                      <a class="active" href="javascript:;" >
                      	  <i class="fa fa-book" aria-hidden="true"></i>                          
                          <span>LIBROS</span>
                      </a>                      
                      <ul class="sub">
                      	  <li>
                      	  		<a href="listadoLibros.jsp">
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Lista</span>
                      	  		</a>
                      	  	</li>
                          <li>
                          	<a  href="nuevoLibro.jsp">
                          		<i class="fa fa-plus-circle" aria-hidden="true"></i>
                          		<span>Nuevo</span>
                          	</a>
						  </li>
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                      	  <i class="fa fa-male" aria-hidden="true"></i>                         
                          <span>AUTORES</span>
                      </a>
                      <ul class="sub">
                      	  <li>
                      	  		<a  href="listadoAutor.jsp">
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Lista</span>
                      	  		</a>
                      	  	</li>
                          <li>
                          	<a  href="nuevoAutor.jsp">
                          		<i class="fa fa-plus-circle" aria-hidden="true"></i>
                          		<span>Nuevo</span>
                          	</a>
						  </li>
                      </ul>
                  </li>    
                  <li class="sub-menu">
                      <a href="javascript:;" >
                      	  <i class="fa fa-male" aria-hidden="true"></i>                         
                          <span>CLIENTES</span>
                      </a>
                      <ul class="sub">
                      	  <li>
                      	  		<a  href="listadoClientes.jsp">
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Lista</span>
                      	  		</a>
                      	  	</li>
                      </ul>
                  </li>     
              </ul>
              <!-- sidebar menu end-->
          </div>
   	
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