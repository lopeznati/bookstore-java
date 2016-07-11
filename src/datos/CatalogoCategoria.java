package datos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidades.Categoria;

public class CatalogoCategoria {

//GETALL
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

//GETONE
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

	public void AltaCategoria(Categoria c){
		//preparo la sentencia sql
		//El PreparedStatement nos permite definir una sentencia SQL base
		PreparedStatement sentencia=null;
		//con el Resulset  creamos una consulta que nos va a regresar datos
		ResultSet rs=null;
		//consulta sql
		String sql="insert into categorias(descripcion) values(?)";
		try {
			
			//abro la conexion a la base de datos
			//Una vez establecida la conexión, podemos crear el PreparedStatement llamando al método prepareStatement() de la Connection.
			//es importante guardar este PreparedStatement en algún sitio al que podamos acceder cuando lo necesitemos
			
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			//primero debemos darle valor a los parámetros que dejamos como interrogantes
			sentencia.setString(1, c.getDescripcion());		
			
			//ejecutamos la sentencia
			sentencia.execute();
			// Se obtiene la clave generada ya que es autoincremntar
			//ResultSet sólo tendrá una fila (el bucle while sólo se ejecutará una vez)
			rs=sentencia.getGeneratedKeys();
		
			if(rs!=null && rs.next()){
				c.setId(rs.getInt(1));
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

	public void BajaCategoria(Categoria c){
		PreparedStatement sentencia=null;
		String sql="delete from categorias where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			sentencia.setInt(1, c.getId());
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

	public void ActualizarCategoria(Categoria nuevacat) {
		PreparedStatement sentencia=null;
		String sql="update autores set descripcion=? where id=?";
		try {
			sentencia=ConnectionDB.getInstancia().getconn().prepareStatement(sql);
			//System.out.println(nuevolib.getIsbn());
			sentencia.setString(1, nuevacat.getDescripcion());
			
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


