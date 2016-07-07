package negocio;
import entidades.Autor;
import datos.CatalogoAutor;

import java.util.ArrayList;

public class ContraladorAutor {

	private CatalogoAutor ca;
	
	public ContraladorAutor() {
		ca = new CatalogoAutor();
	}
	
	public ArrayList<Autor> getAllAutores()
	{
		return ca.getAllAutores();
	}
}
