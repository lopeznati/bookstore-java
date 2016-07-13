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
	
	public void altaAutor(Autor a) {
		ca.AltaAutor(a);
	}
	
	public void bajaAutor(Autor a) {
		ca.BajaAutor(a);
	}
	
	public void ActualizarAutor(Autor a) {
		ca.ActualizarAutor(a);
	}
}
