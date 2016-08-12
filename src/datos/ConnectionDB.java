package datos;

import java.sql.Connection; //para crear la conexion
import java.sql.DriverManager;
import java.sql.SQLException;



public class ConnectionDB {
	
	//creamos una variable de la instancia de la DB
	private static ConnectionDB instancia;
	//metodo para obtener la unica instancia
	public static ConnectionDB getInstancia(){
		if(instancia==null){
			instancia=new ConnectionDB();
		}
		return instancia;
	}
	// DATOS USER
	
	//private static String DBURL="jdbc:mysql://node101493-bookstore.jelasticlw.com.br/bookstore";
	//private static String DBUSER="root";
    //private static String DBPASSWORD="TLYvon47605";
	
	private static String DBURL="jdbc:mysql://localhost:3306/bookstore";
	private static String DBUSER="root";
	private static String DBPASSWORD="";
	
	//CREAMOS UNA VARIABLE DE TIPO CONECCION
	private Connection conn;
	//hacemos la coneccion
	public Connection getconn(){
		
		try {
			//validar si es null la connection, de ser asi abrirla
			if(conn==null || !conn.isValid(3)){
				//cargar en memoria el driver
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				
				//conectamos con la base de datos
				/*crear un objeto de la clase Connection, para esto la clase DriverManager 
				tiene un m�todo llamado getConnection que retorna un objeto de la clase Connection*/
			
				conn=DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			}
			
			
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	//cerrar la conexion
	public void CloseConn(){
		try {
			if(conn!=null  && !conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
