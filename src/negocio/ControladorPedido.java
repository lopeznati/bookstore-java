package negocio;

import java.util.ArrayList;

import datos.CatalogoLibro;
import datos.CatalogoLocalidad;
import datos.CatalogoPedido;
import datos.CatalogoProvincia;

import datos.CatalogoTipoTarjeta;
import entidades.Libro;
import entidades.Localidad;
import entidades.Pedido;
import entidades.Provincia;

import entidades.Tipo_Tarjeta;

public class ControladorPedido {
	
	private CatalogoPedido cp;
	private CatalogoTipoTarjeta tt;
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
	
	public Tipo_Tarjeta getOneTipoTarjeta(int tarjeta_id){
		tt = new CatalogoTipoTarjeta();
		return tt.getOneTipoTarjeta(tarjeta_id);
	}
	
	public ArrayList<Tipo_Tarjeta> getAllTipoTarjeta(){
		tt = new CatalogoTipoTarjeta();
		return tt.getAllTiposTarjetas();
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