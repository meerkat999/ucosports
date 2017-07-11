package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;

public class MedioPagoPorFacturaDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private Integer facturaId;
	
	private String clienteId;
	
	private Integer tipoDocumentoId;
	
	private Integer estadoId;
	
	private Integer medioPagoId;
	
	private Double valor;
	
	private String numBauche;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFacturaId() {
		return facturaId;
	}

	public void setFacturaId(Integer facturaId) {
		this.facturaId = facturaId;
	}

	public String getClienteId() {
		return clienteId;
	}

	public void setClienteId(String clienteId) {
		this.clienteId = clienteId;
	}

	public Integer getTipoDocumentoId() {
		return tipoDocumentoId;
	}

	public void setTipoDocumentoId(Integer tipoDocumentoId) {
		this.tipoDocumentoId = tipoDocumentoId;
	}

	public Integer getEstadoId() {
		return estadoId;
	}

	public void setEstadoId(Integer estadoId) {
		this.estadoId = estadoId;
	}

	public Integer getMedioPagoId() {
		return medioPagoId;
	}

	public void setMedioPagoId(Integer medioPagoId) {
		this.medioPagoId = medioPagoId;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public String getNumBauche() {
		return numBauche;
	}

	public void setNumBauche(String numBauche) {
		this.numBauche = numBauche;
	}

}
