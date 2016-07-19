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
	private CatalogoTipoTarjeta ctt;
	private CatalogoLocalidad cl;
	
	public ControladorPedido() {
		cp = new CatalogoPedido();
	}

	public ArrayList<Pedido> getAllPedidos(){
		return cp.getAllPedidos();
	}
	
	public void altaPedido(Pedido p) {
		cp.altaPedido(p);
	}
	
	public Tipo_Tarjeta getOneTipoTarjeta(int tarjeta_id){
		ctt = new CatalogoTipoTarjeta();
		return ctt.getOneTipoTarjeta(tarjeta_id);
	}
	
	public ArrayList<Tipo_Tarjeta> getAllTipoTarjeta(){
		ctt = new CatalogoTipoTarjeta();
		return ctt.getAllTiposTarjetas();
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