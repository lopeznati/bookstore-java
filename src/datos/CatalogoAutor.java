package datos;
import entidades.Autor;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoAutor {

	public ArrayList<Autor> getAllAutores()
	{
		ArrayList<Autor> autores = new ArrayList<>();
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "select * from autores";
		try{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			while (rs.next())
				{
				Autor a = new Autor();
				a.setId(rs.getInt("id"));
				a.setNombre(rs.getString("nombre"));
				a.setApellido(rs.getString("apellido"));
			
				autores.add(a);
				}
		}
		catch(SQLException e1){
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
		return autores;
	}
	
	public  Autor getOneAutor(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Autor a=null;
		String sql="select * from autores where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				a=new Autor();
				a.setId(rs.getInt("id"));
				a.setNombre(rs.getString("nombre"));
				a.setApellido(rs.getString("apellido"));

				
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		
		return a;
	}
}
