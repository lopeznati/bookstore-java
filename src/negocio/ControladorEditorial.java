package negocio;
import java.util.ArrayList;

import entidades.Editorial;
import datos.CatalogoEditorial;

public class ControladorEditorial {
	
	private CatalogoEditorial ce;
	
	public ControladorEditorial()
	{
		ce = new CatalogoEditorial();
	}
	
	public ArrayList<Editorial> getAllEditoriales()
	{
		return ce.getAllEditoriales();
	}
	public Editorial getOneEditorial(int id) {
		return ce.getOneEditorial(id);
	}
	

}
