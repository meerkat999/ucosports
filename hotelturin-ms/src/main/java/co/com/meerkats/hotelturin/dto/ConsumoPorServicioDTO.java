package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;

public class ConsumoPorServicioDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;

	private Integer servicioAdicionalId;
	
	private Integer clienteConsumoId;
	
	private Double servicioAdicionalValor;

	public Integer getServicioAdicionalId() {
		return servicioAdicionalId;
	}

	public void setServicioAdicionalId(Integer servicioAdicionalId) {
		this.servicioAdicionalId = servicioAdicionalId;
	}

	public Integer getClienteConsumoId() {
		return clienteConsumoId;
	}

	public void setClienteConsumoId(Integer clienteConsumoId) {
		this.clienteConsumoId = clienteConsumoId;
	}

	public Double getServicioAdicionalValor() {
		return servicioAdicionalValor;
	}

	public void setServicioAdicionalValor(Double servicioAdicionalValor) {
		this.servicioAdicionalValor = servicioAdicionalValor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	

}
