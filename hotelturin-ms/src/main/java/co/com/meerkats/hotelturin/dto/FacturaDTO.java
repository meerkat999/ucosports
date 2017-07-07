package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class FacturaDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String clienteId;
	
	private Integer tipodocumentoId;
	
	private Double valor;
	
	private Integer mediodepagoId;
	
	private Date fecha;
	
	private Integer arriendoId;
	
	private String habitacionId;
	
	private Integer clienteconsumoId;
	
	private String numBauche;
	
	private List<ServicioDTO> listaServiciosAConsumir;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Integer getMediodepagoId() {
		return mediodepagoId;
	}

	public void setMediodepagoId(Integer mediodepagoId) {
		this.mediodepagoId = mediodepagoId;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Integer getArriendoId() {
		return arriendoId;
	}

	public void setArriendoId(Integer arriendoId) {
		this.arriendoId = arriendoId;
	}

	public String getHabitacionId() {
		return habitacionId;
	}

	public void setHabitacionId(String habitacionId) {
		this.habitacionId = habitacionId;
	}

	public Integer getClienteconsumoId() {
		return clienteconsumoId;
	}

	public void setClienteconsumoId(Integer clienteconsumoId) {
		this.clienteconsumoId = clienteconsumoId;
	}

	public String getNumBauche() {
		return numBauche;
	}

	public void setNumBauche(String numBauche) {
		this.numBauche = numBauche;
	}

	public List<ServicioDTO> getListaServiciosAConsumir() {
		return listaServiciosAConsumir;
	}

	public void setListaServiciosAConsumir(List<ServicioDTO> listaServiciosAConsumir) {
		this.listaServiciosAConsumir = listaServiciosAConsumir;
	}

}
