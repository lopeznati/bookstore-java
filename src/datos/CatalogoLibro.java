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
		/*El PreparedStatement nos permite definir una sentencia SQL base, 
		 * que nos sirve para modificar/insertar/buscar uno o varios registros 
		 * con sólo cambiar los valores de los parámetros que especifiquemos.
		*/
		//preparo la sentencia sql
		Statement sentencia=null;
		ResultSet rs=null;
		String sql="select * from Libros";
		try {
			//Una vez establecida la conexión, podemos crear el PreparedStatement llamando al método prepareStatement() de la Connection.
			//es importante guardar este PreparedStatement en algún sitio al que podamos acceder cuando lo necesitemos
			sentencia=ConnectionDB.getInstancia().getconn().createStatement();
			//con el Resulset  creamos una consulta que nos va a regresar datos
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
				
				//relaciones
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
	
	public Libro getOneLibro(int idlibro){
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Libro l=null;
		String sql="select * from Libros where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, idlibro);
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
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
			
		return l;
	}
	
	
	public void AltaLibro(Libro l){
		//preparo la sentencia sql
		//El PreparedStatement nos permite definir una sentencia SQL base
		PreparedStatement sentencia=null;
		//con el Resulset  creamos una consulta que nos va a regresar datos
		ResultSet rs=null;
		//consulta sql
		String sql="insert into Libros(isbn,titulo,sipnosis,numero_edicion,cantidad_paginas,precio,existencia,foto,id_editorial,id_categoria,id_autor) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			
			//abro la conexion a la base de datos
			//Una vez establecida la conexión, podemos crear el PreparedStatement llamando al método prepareStatement() de la Connection.
			//es importante guardar este PreparedStatement en algún sitio al que podamos acceder cuando lo necesitemos
			
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			//primero debemos darle valor a los parámetros que dejamos como interrogantes
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
			
			//ejecutamos la sentencia
			sentencia.execute();
			// Se obtiene la clave generada ya que es autoincremntar
			//ResultSet sólo tendrá una fila (el bucle while sólo se ejecutará una vez)
			rs=sentencia.getGeneratedKeys();
		
			if(rs!=null && rs.next()){
				l.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//bloque que si o si se ejecuta comprueba la conexion para cerrarla
		finally{
			try {
				if(sentencia!=null && !sentencia.isClosed()){sentencia.close();}
				ConnectionDB.getInstancia().CloseConn();
				
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
			
		}
	}
	
	public void BajaLibro(Libro l){
		PreparedStatement sentencia=null;
		String sql="delete from Libros where id=?";
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
	
	
	public void ActualizarLibro(Libro nuevolib) {
		PreparedStatement sentencia=null;
		String sql="update Libros set isbn=?, titulo=?, sipnosis=?, numero_edicion=?, cantidad_paginas=?, precio=?, existencia=?, id_editorial=?, id_categoria=?, id_autor=? where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			//System.out.println(nuevolib.getIsbn());
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
