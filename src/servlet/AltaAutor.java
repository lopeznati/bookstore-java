package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.ControladorAutor;
import negocio.ControladorCategoria;
import negocio.ControladorEditorial;
import negocio.ControladorLibro;
import entidades.Autor;
import entidades.Categoria;
import entidades.Editorial;
import entidades.Libro;

/**
 * Servlet implementation class AltaAutor
 */
@WebServlet("/AltaAutor")
public class AltaAutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaAutor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String nombre=request.getParameter("nombre");
		
		String apellido=request.getParameter("apellido");
		
		
		
		Autor a=new Autor(nombre,apellido);
		
		ControladorAutor ca=new ControladorAutor();
		ca.altaAutor(a);
		response.sendRedirect("listadoAutor.jsp");
				
	}

}
