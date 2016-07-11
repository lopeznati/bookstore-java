package datos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidades.Provincia;

public class CatalogoProvincia {

	public ArrayList<Provincia> getAllProvincia()
	{
		ArrayList<Provincia> provincias = new ArrayList<>();
		
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "sentencia * from Provincias";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Provincia e = new Provincia();
				e.setId(rs.getInt("id"));
				e.setNombre(rs.getString("nombre"));
				provincias.add(e);
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
		return provincias;
	}
	
	
	public  Provincia getOneProvincia(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Provincia p=null;
		String sql="select * from provincias where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				p=new Provincia();
				p.setId(rs.getInt("id"));
				p.setNombre(rs.getString("nombre"));
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		return p;
	}
	
}
