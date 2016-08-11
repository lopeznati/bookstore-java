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

import negocio.ControladorCliente;
import negocio.ControladorLibro;
import negocio.ControladorPedido;
import entidades.Cliente;
import entidades.Libro;
import entidades.Localidad;
import entidades.Pedido;

import entidades.Tipo_Tarjeta;

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
		String direccion = request.getParameter("direccion");
		double subtotal = Double.parseDouble(request.getParameter("subtotal"));
		Cliente c = new ControladorCliente().getOneCliente(Integer.parseInt(request.getParameter("cliente_id")));
		Tipo_Tarjeta tt = new ControladorPedido().getOneTipoTarjeta((Integer.parseInt(request.getParameter("tipo_tarjeta_id"))));
		Localidad loc = new ControladorCliente().getOneLocalidad(Integer.parseInt(request.getParameter("localidad_id")));
		String numero_tarjeta= request.getParameter("numero_tarjeta");

		ArrayList<Libro> carrito=(ArrayList<Libro>)session.getAttribute("carrito");
			
		for(int i=0;i<carrito.size();i++){
			if (((carrito.get(i).getExistencia())>0))
			{
				carrito.get(i).setExistencia(carrito.get(i).getExistencia() - 1);
				ControladorLibro cl=new ControladorLibro();
				cl.actualizarLibro(carrito.get(i));
	
				Pedido pedido = new Pedido(direccion,loc,carrito.get(i),c,numero_tarjeta,carrito.get(i).getPrecio(),tt);
			
				ControladorPedido cp = new ControladorPedido();
				cp.altaPedido(pedido);
				session.setAttribute("compra", "La compra se ha realizado con éxito");
				session.setAttribute("msj", " ");
				session.setAttribute("carrito", null);
			}
			else{
					session.setAttribute("msj", "No hay existencia del libro");
				}
		}	
		response.sendRedirect("inicio.jsp");
	}
}
