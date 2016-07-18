<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title></title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
 
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>The Open Book</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
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
                                <div class="task-info">           
                                     <div class="desc"><%=carrito.get(i).getTitulo() %>
                                     <a href="borracar.jsp?id=<%=i%>"><i class="fa fa-trash-o" aria-hidden="true"></i> 
                                     </div>
                                     <div class="percent">$<%=carrito.get(i).getPrecio() %></div>                                       
                                   	 <div><input name="idlibro" type="hidden" id="idlibro" value="<%= carrito.get(i).getId() %>"> </div>
                                </div>                                                                                                              
                            </li> 
                            <%} %> 
                            <%} %>                       
                            <li class="external">
                                <a href="carrito.jsp">Ver Carrito completo</a>
                            </li>
                        </ul>
                    </li>
                    <!-- settings end -->
                    </ul>
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
            	<%if(session.getAttribute("usuario")==null){ %>
                    <li><a class="logout" href="login.jsp">Iniciar Sesión</a></li>
                    <%} else{%>
                    <li><h5 class="centered acomodar">Hola, <%out.print(session.getAttribute("nombreUsuario")); %>!</h5></li>
                    <li><a class="logout" href="login.jsp">Cerrar Sesión</a></li>  
                    <%} %>                  
            	</ul>
            </div>
        </header>
      <!--header end-->
      </section>
      
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
	<script src="assets/js/zabuto_calendar.js"></script>	
	
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
      </body>