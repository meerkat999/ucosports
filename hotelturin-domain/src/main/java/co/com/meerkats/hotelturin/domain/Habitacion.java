package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.EmbeddedId;
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
	private double precio;
	
	@Column(name="habitacion_capacidad")
	private Integer capacidad;
	
	@Column(name="estado_id")
	private Estado estado;
	
	
	@Column(name="habitacion_descripcion")
	private String descripcion;


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public double getPrecio() {
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


	public Estado getEstado() {
		return estado;
	}


	public void setEstado(Estado estado) {
		this.estado = estado;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
	
}