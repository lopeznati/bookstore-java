package negocio;
import entidades.Cliente;
import entidades.Localidad;
import datos.*;

import java.util.ArrayList;

public class ControladorCliente {
	
	private CatalogoCliente cc;
	private CatalogoLocalidad cl;
	
	public ControladorCliente() {
			cc = new CatalogoCliente();
			cl = new CatalogoLocalidad();
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
	
	public void actualizarCliente(Cliente nuevoCli) {
		cc.actualizarCliente(nuevoCli);
	}
	

	public ArrayList<Localidad> getAllLocalidades()
	{
		
		return cl.getAllLocalidades();
		
	}
		
}
