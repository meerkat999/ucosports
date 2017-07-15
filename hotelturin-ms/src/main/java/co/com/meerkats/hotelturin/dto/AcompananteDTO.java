package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;

public class AcompananteDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private String cedulaId;
	
	private Integer tipoDocumentoId;
	
	private Integer arriendoId;
	
	private ClienteDTO cliente;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCedulaId() {
		return cedulaId;
	}

	public void setCedulaId(String cedulaId) {
		this.cedulaId = cedulaId;
	}

	public Integer getTipoDocumentoId() {
		return tipoDocumentoId;
	}

	public void setTipoDocumentoId(Integer tipoDocumentoId) {
		this.tipoDocumentoId = tipoDocumentoId;
	}

	public Integer getArriendoId() {
		return arriendoId;
	}

	public void setArriendoId(Integer arriendoId) {
		this.arriendoId = arriendoId;
	}

	public ClienteDTO getCliente() {
		return cliente;
	}

	public void setCliente(ClienteDTO cliente) {
		this.cliente = cliente;
	}
	
	

}
