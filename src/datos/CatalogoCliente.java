package datos;
import entidades.Cliente;
import entidades.Localidad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoCliente {
	public ArrayList<Cliente> getAllClientes()
	{
		ArrayList<Cliente> clientes = new ArrayList<>();
		
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "select * from Clientes";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Cliente e = new Cliente();
				e.setId(rs.getInt("id"));
				e.setNombre(rs.getString("nombre"));
				e.setApellido(rs.getString("apellido"));
				e.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
				e.setUsuario(rs.getString("usuario"));
				e.setClave(rs.getString("clave"));
				e.setMail(rs.getString("mail"));
				e.setTelefono(rs.getString("telefono"));
				e.setDireccion(rs.getString("direccion"));
				e.setRol(rs.getString("rol"));
				
				Localidad l=new CatalogoLocalidad().getOneLocalidad(rs.getInt("id_localidad"));
				e.setLocalidad(l);
				
				clientes.add(e);
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
		return clientes;
	}
	
	public Cliente getOneLibro(int id){
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Cliente c=null;
		String sql="select * from clientes where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			if(rs.next()){
			c=new Cliente();
			c.setId(rs.getInt("id"));
			c.setUsuario(rs.getString("usuario"));
			c.setClave(rs.getString("clave"));
			c.setNombre(rs.getString("nombre"));
			c.setApellido(rs.getString("apellido"));
			c.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
			c.setTelefono(rs.getString("telefono"));
			c.setMail(rs.getString("mail"));
			c.setDireccion(rs.getString("direccion"));
			c.setRol(rs.getString("rol"));
			c.setFoto(rs.getString("foto"));
			
			Localidad l=new CatalogoLocalidad().getOneLocalidad(rs.getInt("id_localidad"));
			c.setLocalidad(l);
			
			}
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
			
		return c;
	}

}
