package negocio;
import datos.CatalogoCategoria;
import entidades.Categoria;
import entidades.Editorial;

import java.util.ArrayList;

public class ControladorCategoria {
	
	private CatalogoCategoria cc;
	
	public ControladorCategoria()
	{
		cc = new CatalogoCategoria();
	}
	
	public ArrayList<Categoria> getAllCategorias()
	{
		return cc.getAllCategorias();
	}
	
	public Categoria getOneCategoria(int id) {
		return cc.getOneCategoria(id);
	}
}


