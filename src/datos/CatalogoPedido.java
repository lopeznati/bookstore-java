package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import entidades.Cliente;
import entidades.Libro;
import entidades.Localidad;
import entidades.Pedido;
import entidades.Tipo_Tarjeta;

public class CatalogoPedido {

	public ArrayList<Pedido> getAllPedidos()
	{
		ArrayList<Pedido> pedidos = new ArrayList<>();
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "select * from pedidos";
		try
		{			
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Pedido p = new Pedido();
				p.setId(rs.getInt("id"));
				Cliente c = new CatalogoCliente().getOneCliente(rs.getInt("id_cliente"));
				p.setCliente(c);
				Libro l = new CatalogoLibro().getOneLibro(rs.getInt("id_libro"));
				p.setLibro(l);		
				p.setDireccion(rs.getString("direccion"));
				Localidad loc=new CatalogoLocalidad().getOneLocalidad(rs.getInt("id_localidad"));
				p.setLocalidad(loc);
				p.setSubtotal(rs.getDouble("subtotal"));
				Tipo_Tarjeta  tt = new CatalogoTipoTarjeta().getOneTipoTarjeta((rs.getInt("id_tipo_tarjeta")));
				p.setTipo_tarjeta(tt);
				
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
	
	public void altaPedido(Pedido p){

		PreparedStatement sentencia=null;
		ResultSet rs=null;
		String sql="insert into pedidos(fecha_pedido,direccion,subtotal,numero_tarjeta,id_libro,id_cliente,id_localidad,id_tipo_tarjeta) values(?,?,?,?,?,?,?,?)";
		
		try 
		{
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			
			sentencia.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
			sentencia.setString(2, p.getDireccion());
			sentencia.setDouble(3, p.getSubtotal());
			sentencia.setString(4,p.getNumero_tarjeta());
			sentencia.setInt(5, p.getLibro().getId());
			sentencia.setInt(6, p.getCliente().getId());
			sentencia.setInt(7, p.getLocalidad().getId());
			sentencia.setInt(8, p.getTipo_tarjeta().getId());

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
}

