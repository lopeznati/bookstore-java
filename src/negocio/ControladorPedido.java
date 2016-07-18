package negocio;

import java.util.ArrayList;

import datos.CatalogoLibro;
import datos.CatalogoLocalidad;
import datos.CatalogoPedido;
import datos.CatalogoProvincia;
import datos.CatalogoTarjeta;
import entidades.Libro;
import entidades.Localidad;
import entidades.Pedido;
import entidades.Provincia;
import entidades.Tarjeta;

public class ControladorPedido {
	
	private CatalogoPedido cp;
	private CatalogoTarjeta ct;
	private CatalogoLocalidad cl;
	
	public ControladorPedido() {
		cp = new CatalogoPedido();
	}

	public ArrayList<Pedido> getAllPedidos(){
		return cp.getAllPedidos();
	}
	
	public Pedido getOnePedido(int pedido_id){
		return cp.getOnePedido(pedido_id);
	}
	
	public void altaPedido(Pedido p) {
		cp.altaPedido(p);
	}
	
	public void actualizarPedido(Pedido nuevoPed) {
		cp.actualizarPedido(nuevoPed);
	}
	
	public void bajaPedido(Pedido p) {
		cp.bajaPedido(p);
	}
	
	public Tarjeta getOneTarjeta(int tarjeta_id){
		ct = new CatalogoTarjeta();
		return ct.getOneTarjeta(tarjeta_id);
	}
	
	public ArrayList<Tarjeta> getAllTarjeta(){
		ct = new CatalogoTarjeta();
		return ct.getAllTarjetas();
	}
	
	public Localidad getOneLocalidad(int localidad_id){
		cl = new CatalogoLocalidad();
		return cl.getOneLocalidad(localidad_id);
	}
	
	public ArrayList<Localidad> getAllLocalidades(){
		cl = new CatalogoLocalidad();
		return cl.getAllLocalidades();
	}
	
}