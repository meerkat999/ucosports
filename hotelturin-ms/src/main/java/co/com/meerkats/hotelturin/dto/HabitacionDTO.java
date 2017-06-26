package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;

public class HabitacionDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;	
	private String descripcion;
	private Double precio;
	private Integer capacidad;
	private Integer estado;
	private String nombre;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public double getPrecio() {
		return precio;
	}	
	public Integer getCapacidad() {
		return capacidad;
	}
	public void setCapacidad(Integer capacidad) {
		this.capacidad = capacidad;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado_id) {
		this.estado = estado_id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
	

}
