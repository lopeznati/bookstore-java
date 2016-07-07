package negocio;
import java.util.ArrayList;
import entidades.Libro;
import datos.CatalogoLibro;

public class ControladorLibro {
private CatalogoLibro cl;
	
	public ControladorLibro(){
	cl = new CatalogoLibro();
	}
	public ArrayList<Libro> getAllLibros() {
		return cl.getAllLibros();
	}
}
