package datos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidades.Localidad;
import entidades.Provincia;

public class CatalogoLocalidad {
	
	public ArrayList<Localidad> getAllLocalidades()
	{
		ArrayList<Localidad> localidades = new ArrayList<>();
		
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "select * from localidades";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Localidad l = new Localidad();
				l.setId(rs.getInt("id"));
				l.setNombre(rs.getString("nombre"));
				l.setCodigo_postal(rs.getInt("codigo_postal"));
				Provincia p = new CatalogoProvincia().getOneProvincia(rs.getInt("id_provincia"));
				l.setProvincia(p);
				
				localidades.add(l);
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
		return localidades;
	}
	
	public Localidad getOneLocalidad(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Localidad l=null;
		String sql="select * from localidades where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				l=new Localidad();
				l.setId(rs.getInt("id"));
				l.setNombre(rs.getString("nombre"));
				l.setId(rs.getInt("codigo_postal"));
				
				Provincia p=new CatalogoProvincia().getOneProvincia(rs.getInt("id_provincia"));
				l.setProvincia(p);
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		return l;
	}

}
