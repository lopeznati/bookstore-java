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
		String sql = "select * from clientes";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Cliente c = new Cliente();
				c.setId(rs.getInt("id"));
				c.setNombre(rs.getString("nombre"));
				c.setApellido(rs.getString("apellido"));
				c.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
				c.setUsuario(rs.getString("usuario"));
				c.setClave(rs.getString("clave"));
				c.setMail(rs.getString("mail"));
				c.setTelefono(rs.getString("telefono"));
				c.setDireccion(rs.getString("direccion"));
				c.setRol(rs.getString("rol"));
				
				Localidad l=new CatalogoLocalidad().getOneLocalidad(rs.getInt("id_localidad"));
				c.setLocalidad(l);
				
				clientes.add(c);
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
	
	public Cliente getOneCliente(int id){
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
		return c;
	}
	
	public void altaCliente(Cliente c){

		PreparedStatement sentencia=null;
		ResultSet rs=null;
		String sql="insert into clientes(usuario,clave,nombre,apellido,fecha_nacimiento,telefono,mail,direccion,rol,foto,id_localidad) values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try 
		{
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			sentencia.setString(1, c.getUsuario());
			sentencia.setString(2, c.getClave());
			sentencia.setString(3, c.getNombre());
			sentencia.setString(4, c.getApellido());
			sentencia.setDate(5, c.getFecha_nacimiento());
			sentencia.setString(6, c.getTelefono());
			sentencia.setString(7, c.getMail());
			sentencia.setString(8, c.getDireccion());
			sentencia.setString(9, c.getRol());
			sentencia.setString(10, c.getFoto());
			sentencia.setInt(11, c.getLocalidad().getId());

			sentencia.execute();
			rs=sentencia.getGeneratedKeys();
		
			if(rs!=null && rs.next()){
				c.setId(rs.getInt(1));
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
	
	public void bajaCliente(Cliente c){
		PreparedStatement sentencia=null;
		String sql="delete from clientes where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, c.getId());
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
	
	public void actualizarCliente(Cliente nuevoCli) {
		PreparedStatement sentencia=null;
		String sql="update clientes set usuario=?, clave=?, nombre=?, apellido=?, fecha_nacimiento=?, telefono=?, mail=?, direccion=?, rol=?, foto=? id_localidad=? where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setString(1, nuevoCli.getUsuario());
			sentencia.setString(2, nuevoCli.getClave());
			sentencia.setString(3, nuevoCli.getNombre());
			sentencia.setString(4, nuevoCli.getApellido());
			sentencia.setDate(5, nuevoCli.getFecha_nacimiento());
			sentencia.setString(6, nuevoCli.getTelefono());
			sentencia.setString(7, nuevoCli.getMail());
			sentencia.setString(8, nuevoCli.getDireccion());
			sentencia.setString(9, nuevoCli.getRol());
			sentencia.setString(10, nuevoCli.getFoto());
			sentencia.setInt(11, nuevoCli.getLocalidad().getId());
			sentencia.setInt(12, nuevoCli.getId());
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
