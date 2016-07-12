package negocio;
import entidades.Autor;
import datos.CatalogoAutor;

import java.util.ArrayList;

public class ControladorAutor {

	private CatalogoAutor ca;
	
	public ControladorAutor() {
		ca = new CatalogoAutor();
	}
	
	public ArrayList<Autor> getAllAutores()
	{
		return ca.getAllAutores();
	}
	
	public Autor getOneAutor(int id) {
		return ca.getOneAutor(id);
	}
}
