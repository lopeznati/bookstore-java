package datos;
import entidades.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoLibro {
	public ArrayList<Libro> getAllLibros(){
		ArrayList<Libro> libros=new ArrayList<>();
		Statement sentencia=null;
		ResultSet rs=null;
		String sql="select * from libros";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().createStatement();
			rs=sentencia.executeQuery(sql);
			while(rs.next()){
				Libro l=new Libro();
				l.setId(rs.getInt("id"));
				l.setIsbn(rs.getInt("isbn"));
				l.setCantidad_paginas(rs.getInt("cantidad_paginas"));
				l.setExistencia(rs.getInt("existencia"));
				l.setNumero_edicion(rs.getInt("numero_edicion"));
				l.setPrecio(rs.getDouble("precio"));
				l.setTitulo(rs.getString("titulo"));
				l.setFoto(rs.getString("foto"));
				l.setSipnosis(rs.getString("sipnosis"));
				
				Categoria c=new CatalogoCategoria().getOneCategoria(rs.getInt("id_categoria"));
				l.setCategoria(c);
				Editorial e=new CatalogoEditorial().getOneEditorial(rs.getInt("id_editorial"));
				l.setEditorial(e);
				Autor a=new CatalogoAutor().getOneAutor(rs.getInt("id_autor"));
				l.setAutor(a);
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
	
	public Libro getOneLibro(int id){
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Libro l=null;
		String sql="select * from libros where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			if(rs.next()){
			l=new Libro();
			l.setId(rs.getInt("id"));
			l.setIsbn(rs.getInt("isbn"));
			l.setTitulo(rs.getString("titulo"));
			l.setSipnosis(rs.getString("sipnosis"));
			l.setNumero_edicion(rs.getInt("numero_edicion"));
			l.setCantidad_paginas(rs.getInt("cantidad_paginas"));
			l.setExistencia(rs.getInt("existencia"));
			l.setPrecio(rs.getDouble("precio"));
			l.setFoto(rs.getString("foto"));
			l.setSipnosis(rs.getString("sipnosis"));
			
			Categoria c=new CatalogoCategoria().getOneCategoria(rs.getInt("id_categoria"));
			l.setCategoria(c);
			Editorial e=new CatalogoEditorial().getOneEditorial(rs.getInt("id_editorial"));
			l.setEditorial(e);
			Autor a=new CatalogoAutor().getOneAutor(rs.getInt("id_autor"));
			l.setAutor(a);
			
			}
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
			
		return l;
	}
	
	
	public void altaLibro(Libro l){
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		String sql="insert into libros(isbn,titulo,sipnosis,numero_edicion,cantidad_paginas,precio,existencia,foto,id_editorial,id_categoria,id_autor) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			sentencia.setInt(1, l.getIsbn());
			sentencia.setString(2, l.getTitulo());
			sentencia.setString(3, l.getSipnosis());
			sentencia.setInt(4, l.getNumero_edicion());
			sentencia.setInt(5, l.getCantidad_paginas());
			sentencia.setDouble(6, l.getPrecio());
			sentencia.setInt(7, l.getExistencia());
			sentencia.setString(8, l.getFoto());
			sentencia.setInt(9, l.getEditorial().getId());
			sentencia.setInt(10, l.getCategoria().getId());
			sentencia.setInt(11, l.getAutor().getId());
			
			sentencia.execute();
			rs=sentencia.getGeneratedKeys();
		
			if(rs!=null && rs.next()){
				l.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
			
		}
	}
	
	public void bajaLibro(Libro l){
		PreparedStatement sentencia=null;
		String sql="delete from libros where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, l.getId());
			sentencia.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	
	public void actualizarLibro(Libro nuevolib) {
		PreparedStatement sentencia=null;
		String sql="update libros set isbn=?, titulo=?, sipnosis=?, numero_edicion=?, cantidad_paginas=?, precio=?, existencia=?, id_editorial=?, "
					+ "id_categoria=?, id_autor=? where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, nuevolib.getIsbn());
			sentencia.setString(2, nuevolib.getTitulo());
			sentencia.setString(3, nuevolib.getSipnosis());
			sentencia.setInt(4, nuevolib.getNumero_edicion());
			sentencia.setInt(5, nuevolib.getCantidad_paginas());
			sentencia.setDouble(6, nuevolib.getPrecio());
			sentencia.setInt(7, nuevolib.getExistencia());
			sentencia.setInt(8, nuevolib.getEditorial().getId());
			sentencia.setInt(9, nuevolib.getCategoria().getId());
			sentencia.setInt(10, nuevolib.getAutor().getId());
			sentencia.setInt(11, nuevolib.getId());
			sentencia.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			}
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}	
}
