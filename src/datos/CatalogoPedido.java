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
		String sql = "select * from Pedidos";
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

	public void altaPedido(Pedido p){

		PreparedStatement sentencia=null;
		ResultSet rs=null;
		String sql="insert into pedido(fecha_pedido,cantidad_libro,direccion,subtotal,id_tarjeta,id_libro,id_cliente) values(?,?,?,?,?,?,?,?)";
		
		try 
		{
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			sentencia.setDate(1, p.getFecha_pedido());
			sentencia.setInt(2, p.getCantidad_libro());
			sentencia.setString(3, p.getDireccion());
			sentencia.setDouble(4, p.getSubtotal());
			sentencia.setInt(5,p.getTarjeta().getId());
			sentencia.setInt(6, p.getLibro().getId());
			sentencia.setInt(7, p.getCliente().getId());

			sentencia.execute();
			rs=sentencia.getGeneratedKeys();
		
			if(rs!=null && rs.next()){
				p.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
	}
	
	public void bajaPedido(Pedido p){
		PreparedStatement sentencia=null;
		String sql="delete from pedidos where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, p.getId());
			sentencia.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}	
	}
	
	public void actualizarPedido(Pedido nuevoped) {
		PreparedStatement sentencia=null;
		String sql="update pedidos set fecha_pedido=?, direccion=?, id_localidad=?, id_libro=?,,id_cliente=? id_tarjeta=?,subtotal=? where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			
			sentencia.setDate(1, nuevoped.getFecha_pedido());
			sentencia.setString(2, nuevoped.getDireccion());
			sentencia.setInt(3, nuevoped.getLocalidad().getId());
			sentencia.setInt(4, nuevoped.getLibro().getId());
			sentencia.setInt(5, nuevoped.getCliente().getId());
			sentencia.setInt(6, nuevoped.getTarjeta().getId());
			sentencia.setDouble(7, nuevoped.getSubtotal());

			sentencia.setInt(8, nuevoped.getId());
			sentencia.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			}
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}	
	
}

