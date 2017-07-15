package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ArriendoDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String habitacionId;
	
	private String clienteId;
	
	private Integer tipodocumentoId;
	
	private Date dateCheckin;
	
	private Integer numeroAcompanantes;
	
	private Date fecha;
	
	private Integer estadoId;
	
	private Integer numeroNoches;
	
	private Date dateCheckout;
	
	private List<ClienteDTO> acompanantes;
	
	private List<AcompananteDTO> acompanantesDTO;
	
	private ClienteConsumoDTO clienteConsumo;
	
	private ClienteDTO cliente;
	
	private HabitacionDTO habitacion;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHabitacionId() {
		return habitacionId;
	}

	public void setHabitacionId(String habitacionId) {
		this.habitacionId = habitacionId;
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

	public Date getDateCheckin() {
		return dateCheckin;
	}

	public void setDateCheckin(Date dateCheckin) {
		this.dateCheckin = dateCheckin;
	}

	public Integer getNumeroAcompanantes() {
		return numeroAcompanantes;
	}

	public void setNumeroAcompanantes(Integer numeroAcompanantes) {
		this.numeroAcompanantes = numeroAcompanantes;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Integer getEstadoId() {
		return estadoId;
	}

	public void setEstadoId(Integer estadoId) {
		this.estadoId = estadoId;
	}

	public Integer getNumeroNoches() {
		return numeroNoches;
	}

	public void setNumeroNoches(Integer numeroNoches) {
		this.numeroNoches = numeroNoches;
	}

	public Date getDateCheckout() {
		return dateCheckout;
	}

	public void setDateCheckout(Date dateCheckout) {
		this.dateCheckout = dateCheckout;
	}

	public List<ClienteDTO> getAcompanantes() {
		return acompanantes;
	}

	public void setAcompanantes(List<ClienteDTO> acompanantes) {
		this.acompanantes = acompanantes;
	}

	public ClienteConsumoDTO getClienteConsumo() {
		return clienteConsumo;
	}

	public void setClienteConsumo(ClienteConsumoDTO clienteConsumo) {
		this.clienteConsumo = clienteConsumo;
	}

	public ClienteDTO getCliente() {
		return cliente;
	}

	public void setCliente(ClienteDTO cliente) {
		this.cliente = cliente;
	}

	public HabitacionDTO getHabitacion() {
		return habitacion;
	}

	public void setHabitacion(HabitacionDTO habitacion) {
		this.habitacion = habitacion;
	}

	public List<AcompananteDTO> getAcompanantesDTO() {
		return acompanantesDTO;
	}

	public void setAcompanantesDTO(List<AcompananteDTO> acompanantesDTO) {
		this.acompanantesDTO = acompanantesDTO;
	}
	
}
