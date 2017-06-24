package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;

import co.com.meerkats.hotelturin.domain.Estado;

public class HabitacionDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String descripcion;
	private Double precio;
	private Integer capacidad;
	private Estado estado;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public Integer getCapacidad() {
		return capacidad;
	}
	public void setCapacidad(Integer capacidad) {
		this.capacidad = capacidad;
	}
	public Estado getEstado() {
		return estado;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	
	
	
	

}
