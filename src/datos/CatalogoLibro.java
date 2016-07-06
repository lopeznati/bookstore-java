package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidades.*;

public class CatalogoLibro {
	public ArrayList<Libro> getAllLibros(){
		ArrayList<Libro> libros=new ArrayList<>();
		Statement sentencia=null;
		ResultSet rs=null;
		String sql="select * from Libros";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().createStatement();
			rs=sentencia.executeQuery(sql);
			while(rs.next()){
				Libro l=new Libro();
			
				l.setIsbn(rs.getInt("isbn"));
				
				libros.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				if(sentencia!=null){sentencia.close();}
				if(rs!=null){rs.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			
			
		}
		
		return libros;
	}

}
