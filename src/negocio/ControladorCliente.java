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
	
	public Cliente getOneCliente(int idCliente)
	{
		return cc.getOneCliente(idCliente);
	}
	
	public void altaCliente(Cliente c) {
		cc.altaCliente(c);
	}
	
	public void bajaCliente(Cliente c) {
		cc.bajaCliente(c);
	}
	
	public void actualizarLibro(Cliente nuevoCli) {
		cc.actualizarCliente(nuevoCli);
	}
	
}
