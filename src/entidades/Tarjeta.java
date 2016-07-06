package entidades;

public class Tarjeta {
	private int id;
	private String numero_tarjeta;
	private String titular;
	private int codigo_seguridad;
	private int id_tipo_tarjeta;
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
	public int getId_tipo_tarjeta() {
		return id_tipo_tarjeta;
	}
	public void setId_tipo_tarjeta(int id_tipo_tarjeta) {
		this.id_tipo_tarjeta = id_tipo_tarjeta;
	}

}
