package entidades;

public class Tarjeta {
	private int id,codigo_seguridad;
	private String numero_tarjeta,titular;
	private Tipo_Tarjeta tipo_tarjeta;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumero_tarjeta() {
		return numero_tarjeta;
	}
	public void setNumero_tarjeta(String numero_tarjeta) {
		this.numero_tarjeta = numero_tarjeta;
	}
	public String getTitular() {
		return titular;
	}
	public void setTitular(String titular) {
		this.titular = titular;
	}
	public int getCodigo_seguridad() {
		return codigo_seguridad;
	}
	public void setCodigo_seguridad(int codigo_seguridad) {
		this.codigo_seguridad = codigo_seguridad;
	}
	public Tipo_Tarjeta getTipo_tarjeta() {
		return tipo_tarjeta;
	}
	public void setTipo_tarjeta(Tipo_Tarjeta tipo_tarjeta) {
		this.tipo_tarjeta = tipo_tarjeta;
	}

}
