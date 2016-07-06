package presentacion;
import java.sql.Connection;
import java.util.ArrayList;


import entidades.Libro;
import datos.ConnectionDB;

import negocio.ControladorLibro;


public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*Connection conn=ConnectionDB.getInstancia().getconn();
		if(conn!=null){
			System.err.println("holaa");
		}*/
		ControladorLibro cl=new ControladorLibro();
		ArrayList<Libro>l=new ArrayList<>();
		l=cl.getAllLibros();
		for (Libro libros : l) {
			System.out.println(libros.getIsbn());
			
		}

	}

}
