package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import entidades.Localidad;

public class CatalogoLocalidad {
	
	
	//falta getAll()
	
	
	public  Localidad getOneLocalidad(int id) {
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
				
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		
		return l;
	}

}
