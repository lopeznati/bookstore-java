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
	
	public ControladorPedido() {
		cp = new CatalogoPedido();
	}

	public ArrayList<Pedido> getAllPedidos(){
		return cp.getAllPedidos();
	}
	
	public ArrayList<Pedido> getAllPedidosCliente(){
		return cp.getAllPedidosCliente();
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
}
