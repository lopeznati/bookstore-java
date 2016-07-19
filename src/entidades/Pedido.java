package entidades;
import java.sql.Date;

public class Pedido {
	private int id;
	private Date fecha_pedido;
	private String direccion;
	private double subtotal;
	private String numero_tarjeta;
	private Libro libro;
	private Cliente cliente;
	private Localidad localidad;
	private Tipo_Tarjeta tipo_tarjeta;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getFecha_pedido() {
		return fecha_pedido;
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
	
	
	public Tipo_Tarjeta getTipo_tarjeta() {
		return tipo_tarjeta;
	}
	public void setTipo_tarjeta(Tipo_Tarjeta tipo_tarjeta) {
		this.tipo_tarjeta = tipo_tarjeta;
	}
	
	public String getNumero_tarjeta() {
		return numero_tarjeta;
	}
	public void setNumero_tarjeta(String numero_tarjeta) {
		this.numero_tarjeta =numero_tarjeta;
	}

	public Pedido(){
		
	}
	
	public Pedido(String direccion, Localidad loc,Libro l,Cliente c,String numero_tarjeta,Double subtotal,Tipo_Tarjeta tt)
	{
		this.direccion = direccion;
		this.localidad = loc;
		this.libro = l;
		this.cliente = c;
		this.numero_tarjeta = numero_tarjeta;
		this.subtotal = subtotal;
		this.tipo_tarjeta = tt;
	}
}
