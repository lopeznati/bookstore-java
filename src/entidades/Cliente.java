package entidades;

import java.sql.Date;

public class Cliente {
	private int id;
	private String usuario, clave,nombre,apellido,direccion,telefono,mail,rol,foto;
	private Localidad localidad;
	private Date fecha_nacimiento;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public Localidad getLocalidad() {
		return localidad;
	}
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	
	public Cliente(){
		
	}
	
	public Cliente(String usuario,String clave,String nombre,String apellido,Date fecha_nacimiento,String telefono,String mail,String direccion,String rol,String foto,Localidad l)
	{
		
		this.usuario=usuario;
		this.clave=clave;
		this.nombre=nombre;
		this.apellido=apellido;
		this.fecha_nacimiento=fecha_nacimiento;
		this.telefono=telefono;
		this.mail=mail;
		this.direccion=direccion;
		this.rol=rol;
		this.foto=foto;
		this.localidad=l;

	}
}
