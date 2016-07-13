package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.CatalogoLibro;
import negocio.ControladorAutor;
import negocio.ControladorLibro;
import entidades.Autor;
import entidades.Categoria;
import entidades.Editorial;
import entidades.Libro;

/**
 * Servlet implementation class AltaLibro
 */
@WebServlet("/altaLibro")
public class altaLibro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public altaLibro() {
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
		
		int isbn=Integer.parseInt(request.getParameter("isbn"));
		String titulo=request.getParameter("titulo");
		
		String sipnosis=request.getParameter("sipnosis");
		int CantPag=Integer.parseInt(request.getParameter("cpaginas"));
		int NumEdicion=Integer.parseInt(request.getParameter("nedicion"));
		double precio=Double.parseDouble(request.getParameter("precio"));
		int existencia=Integer.parseInt(request.getParameter("nexistencia"));
		
		
		Editorial e=new CatalogoLibro().getOneEditorial(Integer.parseInt(request.getParameter("editorial_id")));
		Categoria c=new CatalogoLibro().getOneCategoria(Integer.parseInt(request.getParameter("categoria_id")));
		Autor a=new ControladorAutor().getOneAutor(Integer.parseInt(request.getParameter("autor_id")));
		String foto=request.getParameter("foto");
		
		
		Libro l=new Libro(isbn,titulo,sipnosis,CantPag,NumEdicion,precio,existencia,e,c,a,foto);
		
		ControladorLibro cl=new ControladorLibro();
		cl.altaLibro(l);
		response.sendRedirect("listadoLibros.jsp");
				
		
		
		
	}

}
