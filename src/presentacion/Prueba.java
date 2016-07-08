package presentacion;
import java.sql.Connection;
import java.util.ArrayList;




import entidades.Autor;
import entidades.Libro;
import datos.CatalogoAutor;
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
			System.out.println(libros.getTitulo());
			System.out.println(libros.getCategoria().getDescripcion());
			System.out.println(libros.getEditorial().getNombre());
			System.out.println(libros.getAutor().getNombre());
			//CatalogoAutor ca=new CatalogoAutor();
			//System.out.println(ca.getOneAutor(1).getNombre());
			
	
			
		}
		
		Libro li=cl.getOneLibro(1);
		
		System.out.println(li.getCantidad_paginas());
		System.out.println(li.getAutor().getNombre());

	}

}
