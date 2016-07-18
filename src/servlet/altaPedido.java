package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import datos.CatalogoCliente;
import datos.CatalogoLibro;
import datos.CatalogoLocalidad;
import datos.CatalogoTarjeta;
import negocio.ControladorCliente;
import negocio.ControladorLibro;
import negocio.ControladorPedido;
import entidades.Cliente;
import entidades.Libro;
import entidades.Localidad;
import entidades.Pedido;
import entidades.Tarjeta;

/**
 * Servlet implementation class altaPedido
 */
@WebServlet("/altaPedido")
public class altaPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public altaPedido() {
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
		
		HttpSession session = request.getSession(true);
		
		Date fecha_pedido = Date.valueOf(request.getParameter("fecha_pedido"));
		String direccion = request.getParameter("direcciom");
		Double subtotal = Double.valueOf(request.getParameter("subtotal"));
		
		Cliente c = new ControladorCliente().getOneCliente(Integer.parseInt(request.getParameter("cliente_id")));
		Tarjeta t = new ControladorPedido().getOneTarjeta(Integer.parseInt(request.getParameter("tarjeta_id")));	
		Libro l = new ControladorLibro().getOneLibro(Integer.parseInt(request.getParameter("libro_id")));
		Localidad loc = new ControladorPedido().getOneLocalidad(Integer.parseInt(request.getParameter("localidad_id")));
			
		if ((l.getExistencia() > 1) && (session.getAttribute("cliente")!=null))
		{
			l.setExistencia(l.getExistencia() - 1);
			Pedido pedido = new Pedido(fecha_pedido,direccion,loc,l,c,t,subtotal);
			
			ControladorPedido cp = new ControladorPedido();
			cp.altaPedido(pedido);
		}
		response.sendRedirect("inicio.jsp");
	}
}
