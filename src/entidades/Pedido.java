package entidades;
import java.sql.Date;

public class Pedido {
	private int id,cantidad_libro;
	private Date fecha_pedido;
	private String direccion;
	private double subtotal;
	private Tarjeta tarjeta;
	private Libro libro;
	private Cliente cliente;
	private Localidad localidad;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getFecha_pedido() {
		return fecha_pedido;
	}
	public void setFecha_pedido(Date fecha_pedido) {
		this.fecha_pedido = fecha_pedido;
	}
	public int getCantidad_libro() {
		return cantidad_libro;
	}
	public void setCantidad_libro(int cantidad_libro) {
		this.cantidad_libro = cantidad_libro;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Tarjeta getTarjeta() {
		return tarjeta;
	}
	public void setTarjeta(Tarjeta tarjeta) {
		this.tarjeta = tarjeta;
	}
	public Libro getLibro() {
		return libro;
	}
	public void setLibro(Libro libro) {
		this.libro = libro;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Localidad getLocalidad() {
		return localidad;
	}
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
	public Pedido(){
		
	}
	
	public Pedido(Date fecha_pedido,String direccion, Localidad loc,Libro l,Cliente c,Tarjeta t,Double subtotal)
	{
		this.fecha_pedido = fecha_pedido;
		this.direccion = direccion;
		this.localidad = loc;
		this.libro = l;
		this.cliente = c;
		this.tarjeta = t;
		this.subtotal = subtotal;
	}
}
