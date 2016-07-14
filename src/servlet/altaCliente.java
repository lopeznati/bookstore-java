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

import datos.CatalogoLocalidad;
import negocio.ControladorCliente;
import entidades.Cliente;
import entidades.Localidad;

/**
 * Servlet implementation class ModificarCliente
 */
@WebServlet("/modificarCliente")
public class altaCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public altaCliente() {
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
		
		boolean band = false;
		String usuario = request.getParameter("usuario");
		String clave =request.getParameter("clave");

		ControladorCliente cc = new ControladorCliente();
		ArrayList<Cliente> clientes = cc.getAllClientes();
		Cliente clienteActual = new Cliente();
		for(Cliente cliente : clientes){
			if(usuario == cliente.getUsuario() && clave == cliente.getClave()){
				band = true;
				clienteActual = cliente;
				HttpSession session = request.getSession(true);
			    session.setAttribute("usuario",usuario);
			    
			}		
		}
		
		if(clienteActual.getRol() == "admin"){
			response.sendRedirect("inicioAdmin.jsp");
		} else response.sendRedirect("inicio.jsp");
		
	}

}