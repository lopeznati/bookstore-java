package presentacion;
import java.util.ArrayList;
import entidades.Libro;
import negocio.ControladorLibro;


public class Prueba {

	public static void main(String[] args) {
		/*Connection conn=ConnectionDB.getInstancia().getconn();
		if(conn!=null){
			System.err.println("holaa");
		}*/
		ControladorLibro cl=new ControladorLibro();
		ArrayList<Libro> l=new ArrayList<>();
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

		}
		
		
		
		
		//alta
		/*
		Libro li=cl.getOneLibro(1);
		
		System.out.println(li.getCantidad_paginas());
		System.out.println(li.getAutor().getNombre());
		
		li.setIsbn(1111);
		li.setTitulo("cazadores de sombras");
		li.setSinopsis("aaaaa");
		li.setNumero_edicion(2);
		li.setCantidad_paginas(400);
		li.setPrecio(20);
		li.setExistencia(2);
		li.setEditorial(cl.getOneLibro(1).getEditorial());
		li.setCategoria(cl.getOneLibro(1).getCategoria());
		li.setAutor(cl.getOneLibro(1).getAutor());
		
		cl.altaLibro(li);
		
		*/
		
		//baja
		
		/*
		cl.bajaLibro(cl.getOneLibro(3));
		
		*/
		
		//modificacion
		
		/*
		
		Libro li2=cl.getOneLibro(1);
		
	
		li2.setIsbn(2222);
		li2.setTitulo("cazadores de sombras");
		li2.setSinopsis("bbaaa");
		li2.setNumero_edicion(2);
		li2.setCantidad_paginas(400);
		li2.setPrecio(20);
		li2.setExistencia(2);
		li2.setEditorial(cl.getOneLibro(1).getEditorial());
		li2.setCategoria(cl.getOneLibro(1).getCategoria());
		li2.setAutor(cl.getOneLibro(4).getAutor());
		
		cl.ActualizarLibro(li2);
		
		*/
}

