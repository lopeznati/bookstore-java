package negocio;
import java.util.ArrayList;

import entidades.*;
import datos.*;

public class ControladorLibro {
private CatalogoLibro cl;
private CatalogoCategoria cc;
private CatalogoEditorial ce;

	public ControladorLibro(){
		cl = new CatalogoLibro();
		cc = new CatalogoCategoria();
		ce = new CatalogoEditorial();

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
	
<<<<<<< HEAD
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
=======
	public void getAllCategorias(){
		cc.getAllCategorias();
>>>>>>> a92e5011cc3e3942f06a0d7520098671b31d82ed
	}

	public void getAllEditoriales(){
		ce.getAllEditoriales();
	}
}
