package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidades.Cliente;
import entidades.Libro;
import entidades.Pedido;
import entidades.Tarjeta;

public class CatalogoPedido {

	public ArrayList<Pedido> getAllPedidos()
	{
		ArrayList<Pedido> pedidos = new ArrayList<>();
		
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "sentencia * from Pedidos";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Pedido p = new Pedido();
				p.setId(rs.getInt("id"));
				p.setFecha_pedido(rs.getDate("fecha_pedido"));
				p.setCantidad_libro(rs.getInt("cantidad_libro"));
				p.setDireccion(rs.getString("direccion"));
				p.setSubtotal(rs.getDouble("subtotal"));
				
				Tarjeta t = new CatalogoTarjeta().getOneTarjeta(rs.getInt("id_tarjeta"));
				p.setTarjeta(t);
				
				Libro l = new CatalogoLibro().getOneLibro(rs.getInt("id_libro"));
				p.setLibro(l);
				
				Cliente c = new CatalogoCliente().getOneCliente(rs.getInt("id_cliente"));
				p.setCliente(c);
				
				pedidos.add(p);
			}
		}
		catch(SQLException e1)
		{
			e1.printStackTrace();
		}
		finally{
			try{
				if (sentencia != null)
					sentencia.close();
				if (rs != null)
					rs.close();
				ConnectionDB.getInstancia().CloseConn();
			}
			catch(SQLException e2){
				e2.printStackTrace();
			}
		}
		return pedidos;
	}
	
	public Pedido getOnePedido(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Pedido p=null;
		String sql="select * from pedidos where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				p = new Pedido();
				p.setId(rs.getInt("id"));
				p.setFecha_pedido(rs.getDate("fecha_pedido"));
				p.setCantidad_libro(rs.getInt("cantidad_libro"));
				p.setDireccion(rs.getString("direccion"));
				p.setSubtotal(rs.getDouble("subtotal"));
				
				Tarjeta t = new CatalogoTarjeta().getOneTarjeta(rs.getInt("id_tarjeta"));
				p.setTarjeta(t);
				
				Libro l = new CatalogoLibro().getOneLibro(rs.getInt("id_libro"));
				p.setLibro(l);
				
				Cliente c = new CatalogoCliente().getOneCliente(rs.getInt("id_cliente"));
				p.setCliente(c);
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		return p;
	}

	
}
