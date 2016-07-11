package datos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Editorial;

public class CatalogoEditorial {
	
	public ArrayList<Editorial> getAllEditoriales()
	{
		ArrayList<Editorial> editoriales = new ArrayList<>();
		
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "select * from editoriales";
		try
		{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			
			while (rs.next()){
				Editorial e = new Editorial();
				e.setId(rs.getInt("id"));
				e.setNombre(rs.getString("nombre"));
				editoriales.add(e);
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
		return editoriales;
	}
	
	public  Editorial getOneEditorial(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Editorial e=null;
		String sql="select * from Editoriales where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				e=new Editorial();
				e.setId(rs.getInt("id"));
				e.setNombre(rs.getString("nombre"));
				
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		
		return e;
	}
}
