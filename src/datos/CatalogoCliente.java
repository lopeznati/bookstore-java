package datos;
import entidades.Cliente;
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
		String sql = "sentencia * from Clientes";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Cliente e = new Cliente();
				e.setId(rs.getInt("id"));
				e.setNombre(rs.getString("nombre"));
				e.setApellido(rs.getString("apellido"));
				e.setUsuario(rs.getString("usuario"));
				e.setClave(rs.getString("clave"));
				e.setMail(rs.getString("mail"));
				e.setTelefono(rs.getString("telefono"));
				e.setRol(rs.getString("rol"));
				
				
				//Agregar localidad que es clave forranea
				
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

}
