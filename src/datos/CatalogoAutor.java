package datos;
import entidades.Autor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoAutor {

//GETALL
	public ArrayList<Autor> getAllAutores()
	{
		ArrayList<Autor> autores = new ArrayList<>();
		Statement sentencia = null;
		ResultSet rs = null;
		String sql = "select * from autores";
		try{
			sentencia = ConnectionDB.getInstancia().getconn().createStatement();
			rs = sentencia.executeQuery(sql);
			while (rs.next())
				{
				Autor a = new Autor();
				a.setId(rs.getInt("id"));
				a.setNombre(rs.getString("nombre"));
				a.setApellido(rs.getString("apellido"));
			
				autores.add(a);
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
			catch(SQLException e2){
				e2.printStackTrace();
			}
		}
		return autores;
	}

//GET ONE 
	public  Autor getOneAutor(int id) {
		PreparedStatement sentencia=null;
		ResultSet rs=null;
		Autor a=null;
		String sql="select * from autores where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, id);
			rs=sentencia.executeQuery();
			
			if(rs.next()){
				a=new Autor();
				a.setId(rs.getInt("id"));
				a.setNombre(rs.getString("nombre"));
				a.setApellido(rs.getString("apellido"));

				
			}
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		
		return a;
	}

//ALTA AUTOR
	public void AltaAutor(Autor a){
		//preparo la sentencia sql
		//El PreparedStatement nos permite definir una sentencia SQL base
		PreparedStatement sentencia=null;
		//con el Resulset  creamos una consulta que nos va a regresar datos
		ResultSet rs=null;
		//consulta sql
		String sql="insert into autores(nombre,apellido) values(?,?)";
		try {
			
			//abro la conexion a la base de datos
			//Una vez establecida la conexión, podemos crear el PreparedStatement llamando al método prepareStatement() de la Connection.
			//es importante guardar este PreparedStatement en algún sitio al que podamos acceder cuando lo necesitemos
			
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			//primero debemos darle valor a los parámetros que dejamos como interrogantes
			sentencia.setString(1, a.getNombre());
			sentencia.setString(2, a.getApellido());			
			
			//ejecutamos la sentencia
			sentencia.execute();
			// Se obtiene la clave generada ya que es autoincremntar
			//ResultSet sólo tendrá una fila (el bucle while sólo se ejecutará una vez)
			rs=sentencia.getGeneratedKeys();
		
			if(rs!=null && rs.next()){
				a.setId(rs.getInt(1));
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

//BAJA AUTOR
public void BajaAutor(Autor a){
	PreparedStatement sentencia=null;
	String sql="delete from autores where id=?";
	try {
		sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
		sentencia.setInt(1, a.getId());
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

//UPDATE AUTOR
public void ActualizarAutor(Autor nuevoaut) {
	PreparedStatement sentencia=null;
	String sql="update autores set nombre=?, apellido=? where id=?";
	try {
		sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
		//System.out.println(nuevolib.getIsbn());
		sentencia.setString(1, nuevoaut.getNombre());
		sentencia.setString(2, nuevoaut.getApellido());
		
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