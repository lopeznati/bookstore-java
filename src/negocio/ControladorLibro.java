package negocio;
import java.util.ArrayList;
import entidades.*;
import datos.*;

public class ControladorLibro {
private CatalogoLibro cl;
private CatalogoCategoria cc;
	
	public ControladorLibro(){
	cl = new CatalogoLibro();
	cc=new CatalogoCategoria();
	}
	public ArrayList<Libro> getAllLibros() {
		return cl.getAllLibros();
	}
	
	public Libro getOneLibro(int idlibro) {
		return cl.getOneLibro(idlibro);
	}
	

}
