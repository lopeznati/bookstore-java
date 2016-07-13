package negocio;
import java.util.ArrayList;

import entidades.*;
import datos.*;

public class ControladorLibro {
private CatalogoLibro cl;

	public ControladorLibro(){
		cl = new CatalogoLibro();

	}
	public ArrayList<Libro> getAllLibros() {
		return cl.getAllLibros();
	}
	
	public Libro getOneLibro(int idlibro) {
		return cl.getOneLibro(idlibro);
	}
	
	public void altaLibro(Libro l) {
		cl.altaLibro(l);
	}
	
	public void bajaLibro(Libro l) {
		cl.bajaLibro(l);
	}
	
	public void actualizarLibro(Libro nuevolib) {
		cl.actualizarLibro(nuevolib);
	}
	
	public ArrayList<Categoria> getAllCategorias()
	{
		CatalogoCategoria cc = new CatalogoCategoria();
		return cc.getAllCategorias();	
	}
	
	public Categoria getOneCategoria(int categoria_id)
	{
		CatalogoCategoria cc = new CatalogoCategoria();
		return cc.getOneCategoria(categoria_id);
	}
	
	public ArrayList<Editorial> getAllEditoriales()
	{
		CatalogoEditorial ce = new CatalogoEditorial();
		return ce.getAllEditoriales();
	}
	
	public Editorial getOneEditorial(int editorial_id)
	{
		CatalogoEditorial ce = new CatalogoEditorial();
		return ce.getOneEditorial(editorial_id);
	}

}
