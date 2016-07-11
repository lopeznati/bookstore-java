package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidades.Tarjeta;
import entidades.Tipo_Tarjeta;

public class CatalogoTarjeta {
	
	public ArrayList<Tarjeta> getAllTarjetas()
	{
		ArrayList<Tarjeta> tarjetas = new ArrayList<>();
		
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "sentencia * from Tarjetas";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Tarjeta t = new Tarjeta();
				t.setId(rs.getInt("id"));
				t.setNumero_tarjeta(rs.getString("numero_tarjeta"));
				t.setTitular(rs.getString("titular"));
				
				
				Tipo_Tarjeta tt = new CatalogoTipoTarjeta().getOneTipoTarjeta(rs.getInt("id_tipo_tarjeta"));
				t.setTipo_tarjeta(tt);
				
				tarjetas.add(t);
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
		return tarjetas;
	}
	
	public Tarjeta getOneTarjeta(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Tarjeta t=null;
		String sql="select * from tarjetas where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				t=new Tarjeta();
				t.setId(rs.getInt("id"));
				t.setNumero_tarjeta(rs.getString("numero_tarjeta"));
				t.setTitular(rs.getString("titular"));
				
				Tipo_Tarjeta tt = new CatalogoTipoTarjeta().getOneTipoTarjeta(rs.getInt("id_tipo_tarjeta"));
				t.setTipo_tarjeta(tt);
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		return t;
	}

}
