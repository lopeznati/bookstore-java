package servlet;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import negocio.ControladorCliente;
import negocio.ControladorLibro;
import negocio.ControladorPedido;
import entidades.Cliente;
import entidades.Libro;
import entidades.Localidad;
import entidades.Pedido;
import entidades.Tarjeta;

/**
 * Servlet implementation class modificarPedido
 */
@WebServlet("/modificarPedido")
public class modificarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarPedido() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		Cliente c = new ControladorCliente().getOneCliente(Integer.parseInt("cliente_id"));
		Libro l = new ControladorLibro().getOneLibro(Integer.parseInt("libro_id"));
		Localidad loc = new ControladorPedido().getOneLocalidad(Integer.parseInt("localidad_id"));
		Tarjeta t = new ControladorPedido().getOneTarjeta(Integer.parseInt("tarjeta_id"));
		Date fecha_pedido = Date.valueOf(request.getParameter("fecha_pedido"));
		String direccion = request.getParameter("direccion");
		double subtotal = Double.valueOf(request.getParameter("subtotal"));
		
		Pedido p = new Pedido(fecha_pedido,direccion,loc,l,c,t,subtotal);
		p.setId(id);

		ControladorPedido cp = new ControladorPedido();
		cp.actualizarPedido(p);
		response.sendRedirect("listadoPedidos.jsp");

	}

}
