package entidades;

public class Libro {
	private int id,isbn,numero_edicion,cantidad_paginas, existencia;
	private String titulo,sipnosis,foto;	
	private double precio;
	private Editorial editorial;
	private Categoria categoria;
	private Autor autor;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getSipnosis() {
		return sipnosis;
	}
	public void setSipnosis(String sinopsis) {
		this.sipnosis = sinopsis;
	}
	public int getNumero_edicion() {
		return numero_edicion;
	}
	public void setNumero_edicion(int numero_edicion) {
		this.numero_edicion = numero_edicion;
	}
	public int getCantidad_paginas() {
		return cantidad_paginas;
	}
	public void setCantidad_paginas(int cantidad_paginas) {
		this.cantidad_paginas = cantidad_paginas;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getExistencia() {
		return existencia;
	}
	public void setExistencia(int existencia) {
		this.existencia = existencia;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public Editorial getEditorial() {
		return editorial;
	}
	public void setEditorial(Editorial editorial) {
		this.editorial = editorial;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	public Autor getAutor() {
		return autor;
	}
	public void setAutor(Autor autor) {
		this.autor = autor;
	}
	
	public Libro(){
		
	}
	public Libro(int isbn, String titulo, 
			String sipnosis, int cantPag, int numEdicion, double precio,
			int existencia, Editorial e, Categoria c, Autor a, String foto) {
		
		this.isbn=isbn;
		this.titulo=titulo;
		this.sipnosis=sipnosis;
		this.cantidad_paginas=cantPag;
		this.numero_edicion=numEdicion;
		this.precio=precio;
		this.existencia=existencia;
		this.editorial=e;
		this.categoria=c;
		this.autor=a;
		this.foto=foto;

	}
}
