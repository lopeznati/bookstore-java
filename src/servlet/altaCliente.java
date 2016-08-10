package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.CatalogoLocalidad;
import negocio.ControladorCliente;
import entidades.*;
import entidades.Localidad;

/**
 * Servlet implementation class AltaLibro
 */
@WebServlet("/altaCliente")
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
		
		String usuario = request.getParameter("usuario");
		String clave = request.getParameter("clave");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String direccion = request.getParameter("direccion");
		String telefono = request.getParameter("telefono");
		String mail = request.getParameter("mail");		
		String rol = request.getParameter("rol");
		Localidad localidad = new CatalogoLocalidad().getOneLocalidad(Integer.parseInt(request.getParameter("localidad_id")));	
		Date fecha_nacimiento = Date.valueOf(request.getParameter("fecha_nacimiento"));
		
		Cliente cliente = new Cliente(usuario,clave,nombre,apellido,fecha_nacimiento,telefono,mail,direccion,rol,localidad);
		
		ControladorCliente cc = new ControladorCliente();
		cc.altaCliente(cliente);
		response.sendRedirect("login.jsp");
	}

}
