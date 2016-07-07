package datos;

import entidades.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.*;

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
				
				//agregar categoria, editorial y  autor
				
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

}
