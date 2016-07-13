package negocio;
import entidades.Cliente;
import datos.CatalogoCliente;
import java.util.ArrayList;

public class ControladorCliente {
	
	private CatalogoCliente cc;
	
	public ControladorCliente() {
			cc = new CatalogoCliente();
		}
		
	public ArrayList<Cliente> getAllClientes()
		{
			return cc.getAllClientes();
		}
}
