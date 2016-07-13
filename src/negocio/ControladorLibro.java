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
	
	

}
