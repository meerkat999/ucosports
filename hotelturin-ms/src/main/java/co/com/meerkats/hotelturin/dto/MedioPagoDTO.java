package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;

public class MedioPagoDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String nombre;

	private Boolean needBauche;
	
	private Boolean needDevuelta;
	
	private Double valor;
	
	private String numBauche;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Boolean getNeedBauche() {
		return needBauche;
	}

	public void setNeedBauche(Boolean needBauche) {
		this.needBauche = needBauche;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Boolean getNeedDevuelta() {
		return needDevuelta;
	}

	public void setNeedDevuelta(Boolean needDevuelta) {
		this.needDevuelta = needDevuelta;
	}

	public String getNumBauche() {
		return numBauche;
	}

	public void setNumBauche(String numBauche) {
		this.numBauche = numBauche;
	}
	
}
