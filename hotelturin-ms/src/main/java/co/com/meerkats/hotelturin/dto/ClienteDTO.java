package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;

public class ClienteDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String nombreCompleto;
	
	private ClienteKeyDTO id;

	public String getNombreCompleto() {
		return nombreCompleto;
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	public ClienteKeyDTO getId() {
		return id;
	}

	public void setId(ClienteKeyDTO id) {
		this.id = id;
	}
	
	
}
