package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Provincia;
import entidades.Tipo_Tarjeta;

public class CatalogoTipoTarjeta {

	public ArrayList<Tipo_Tarjeta> getAllTiposTarjetas()
	{
		ArrayList<Tipo_Tarjeta> tipos_tarjetas = new ArrayList<>();
		
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "select * from Tipos_Tarjetas";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Tipo_Tarjeta tt=new Tipo_Tarjeta();
				tt.setId(rs.getInt("id"));
				tt.setNombre(rs.getString("nombre"));
				Provincia p = new CatalogoProvincia().getOneProvincia(rs.getInt("id_provincia"));
				tt.setProvincia(p);
				
				tipos_tarjetas.add(tt);
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
		return tipos_tarjetas;
	}
	
	
	public Tipo_Tarjeta getOneTipoTarjeta(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Tipo_Tarjeta tt=null;
		String sql="select * from tipos_tarjetas where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				tt=new Tipo_Tarjeta();
				tt.setId(rs.getInt("id"));
				tt.setNombre(rs.getString("nombre"));
				
				Provincia p=new CatalogoProvincia().getOneProvincia(rs.getInt("id_provincia"));
				tt.setProvincia(p);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return tt;
	}

}
