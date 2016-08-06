package servlet;

import java.io.IOException;
import java.sql.Date;

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
public class modificarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarCliente() {
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
		
		int id = Integer.parseInt(request.getParameter("id"));
		String usuario = request.getParameter("usuario");
		String clave =request.getParameter("clave");
		String nombre = request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		Date fecha_nacimiento = Date.valueOf(request.getParameter("fecha_nacimiento"));
		String telefono = request.getParameter("telefono");
		String mail = request.getParameter("mail");
		String direccion = request.getParameter("direccion");
		String rol = request.getParameter("rol");
		
		Localidad l = new CatalogoLocalidad().getOneLocalidad(Integer.parseInt(request.getParameter("localidad_id")));
		
		Cliente c = new Cliente(usuario,clave,nombre,apellido,fecha_nacimiento,telefono,mail,direccion,rol,l);
		c.setId(id);

		ControladorCliente cc = new ControladorCliente();
		cc.actualizarCliente(c);
		HttpSession session = request.getSession(true);
		
		if ((session.getAttribute("rolUsuario").equals("admin"))){
			response.sendRedirect("inicioAdmin.jsp");
   	
		
		}
   	else{
   		response.sendRedirect("inicio.jsp");
		}
		
		
	}

}
