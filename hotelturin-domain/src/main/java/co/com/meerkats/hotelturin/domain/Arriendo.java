package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="arriendo")
public class Arriendo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="arriendo_id")
	private Integer id;
	
	@Column(name="habitacion_id")
	private String habitacionId;
	
	@Column(name="cliente_id")
	private String clienteId;
	
	@Column(name="tipodocumento_id")
	private Integer tipodocumentoId;
	
	@Column(name="arriendo_checkin")
	private Date dateCheckin;
	
	@Column(name="arriendo_num_acompanantes")
	private Integer numeroAcompanantes;
	
	@Column(name="arriendo_fecha")
	private Date fecha;
	
	@Column(name="estado_id")
	private Integer estadoId;
	
	@Column(name="arriendo_num_noches")
	private Integer numeroNoches;
	
	@Column(name="arriendo_checkout")
	private Date dateCheckout;

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
	
	
	
		
	
}