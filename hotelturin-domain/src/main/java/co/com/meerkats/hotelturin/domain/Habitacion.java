package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="habitacion")
public class Habitacion implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="habitacion_id")
	private String id;
	
	@Column(name="habitacion_precio")
	private Double precio;
	
	@Column(name="habitacion_capacidad")
	private Integer capacidad;
	
	@Column(name="estado_id")
	private Integer estado;
	
	@Column(name="habitacion_descripcion")
	private String descripcion;
	
	@Column(name="habitacion_nombre")
	private String nombre;

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Double getPrecio() {
		return precio;
	}


	public void setPrecio(Double precio) {
		this.precio = precio;
	}


	public Integer getCapacidad() {
		return capacidad;
	}


	public void setCapacidad(Integer capacidad) {
		this.capacidad = capacidad;
	}

	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public Integer getEstado() {
		return estado;
	}


	public void setEstado(Integer estado) {
		this.estado = estado;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
	
}