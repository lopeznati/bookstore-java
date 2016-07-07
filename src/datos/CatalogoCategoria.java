package datos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Categoria;

public class CatalogoCategoria {
	
	public ArrayList<Categoria> getAllCategorias(){
	ArrayList<Categoria> categorias = new ArrayList<>();
	Statement sentencia = null;
	ResultSet rs = null;
	String sql = "select * from categorias";
	try{
		sentencia = ConnectionDB.getInstancia().getconn().createStatement();
		rs = sentencia.executeQuery(sql);
		
		while (rs.next())
		{
			Categoria c = new Categoria();
			c.setId(rs.getInt("id"));
			c.setDescripcion(rs.getString("descripcion"));
			categorias.add(c);
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
		catch(SQLException e2)
		{
			e2.printStackTrace();
		}
	}
	return categorias;
	}
	
	public Categoria getOneCategoria(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Categoria c=null;
		String sql="select * from Categorias where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				c=new Categoria();
				c.setId(rs.getInt("id"));
				c.setDescripcion(rs.getString("descripcion"));
				
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		
		return c;
		
	}
}

