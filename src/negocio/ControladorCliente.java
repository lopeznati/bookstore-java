package negocio;
import entidades.Cliente;
import entidades.Localidad;
import datos.CatalogoCliente;
import datos.CatalogoLocalidad;

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
	
	public void actualizarCliente(Cliente nuevoCli) {
		cc.actualizarCliente(nuevoCli);
	}
	

	public ArrayList<Localidad> getAllLocalidades()
	{
		CatalogoLocalidad cl = new CatalogoLocalidad();
		return cl.getAllLocalidades();
		
	}
}
