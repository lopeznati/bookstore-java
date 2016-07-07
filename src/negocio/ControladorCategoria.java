package negocio;
import datos.CatalogoCategoria;
import entidades.Categoria;
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
}


