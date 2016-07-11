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
 * Servlet implementation class AltaLibro
 */
@WebServlet("/AltaLibro")
public class AltaLibro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaLibro() {
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
		
		int isbn=Integer.parseInt(request.getParameter("isbn"));
		String titulo=request.getParameter("titulo");
		
		String sipnosis=request.getParameter("sipnosis");
		int CantPag=Integer.parseInt(request.getParameter("cpaginas"));
		int NumEdicion=Integer.parseInt(request.getParameter("nedicion"));
		double precio=Double.parseDouble(request.getParameter("precio"));
		int existencia=Integer.parseInt(request.getParameter("nexistencia"));
		Editorial e=new ControladorEditorial().getOneEditorial(Integer.parseInt(request.getParameter("editorial_id")));
		Categoria c=new ControladorCategoria().getOneCategoria(Integer.parseInt(request.getParameter("categoria_id")));
		Autor a=new ControladorAutor().getOneAutor(Integer.parseInt(request.getParameter("autor_id")));
		String foto=request.getParameter("foto");
		
		
		Libro l=new Libro(isbn,titulo,sipnosis,CantPag,NumEdicion,precio,existencia,e,c,a,foto);
		
		ControladorLibro cl=new ControladorLibro();
		cl.altaLibro(l);
		response.sendRedirect("ListadoLibros.jsp");
				
		
		
		
	}

}
