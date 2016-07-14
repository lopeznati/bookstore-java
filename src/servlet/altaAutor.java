package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.ControladorAutor;
import entidades.Autor;

/**
 * Servlet implementation class AltaAutor
 */
@WebServlet("/altaAutor")
public class altaAutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public altaAutor() {
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

		String nombre=request.getParameter("nombre");
		
		String apellido=request.getParameter("apellido");
		
		Autor a=new Autor(nombre,apellido);
		
		ControladorAutor ca = new ControladorAutor();
		ca.altaAutor(a);
		response.sendRedirect("listadoAutor.jsp");
	}

}
