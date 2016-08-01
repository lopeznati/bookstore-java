package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import negocio.ControladorLibro;
import entidades.Libro;

/**
 * Servlet implementation class carrito
 */
@WebServlet("/carrito")
public class carrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public carrito() {
        super();
        // TODO Auto-generated constructor stub
    }

    String url;
    HttpSession session;
    ArrayList<Libro> carrito;
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
		
		
		Libro l = new ControladorLibro().getOneLibro(Integer.parseInt(request.getParameter("id")));
		
		HttpSession session = request.getSession(true);
		if(session.getAttribute("carrito")!=null){
			carrito = (ArrayList<Libro>)session.getAttribute("carrito");
			carrito.add(l);
			session.setAttribute("carrito", carrito);
		}else{
			carrito=new ArrayList<Libro>();
			carrito.add(l);
			session.setAttribute("carrito", carrito);
		}
		response.sendRedirect("carrito.jsp");
	}

}
