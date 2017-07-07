package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.Date;

public class ClienteConsumoDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String clienteId;
	
	private Integer tipodocumentoId;
	
	private Double saldo;
	
	private Double total;
	
	private Date fecha;
	
	private Integer estado_id;

	public String getClienteId() {
		return clienteId;
	}

	public void setClienteId(String clienteId) {
		this.clienteId = clienteId;
	}

	public Integer getTipodocumentoId() {
		return tipodocumentoId;
	}

	public void setTipodocumentoId(Integer tipodocumentoId) {
		this.tipodocumentoId = tipodocumentoId;
	}

	public Double getSaldo() {
		return saldo;
	}

	public void setSaldo(Double saldo) {
		this.saldo = saldo;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Integer getEstado_id() {
		return estado_id;
	}

	public void setEstado_id(Integer estado_id) {
		this.estado_id = estado_id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
