package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="consumoporservicio") 
public class ConsumoPorServicio implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="consumoporservicio_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="clienteconsumo_id")
	private ClienteConsumo clienteConsumo;
	
	@ManyToOne
	@JoinColumn(name = "servicioadicional_id")
	private Servicio servicio;
	
	@Column(name = "servicioadicional_valor")
	private Double servicioValor;

	public Double getServicioValor() {
		return servicioValor;
	}

	public void setServicioValor(Double servicioValor) {
		this.servicioValor = servicioValor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ClienteConsumo getClienteConsumo() {
		return clienteConsumo;
	}

	public void setClienteConsumo(ClienteConsumo clienteConsumo) {
		this.clienteConsumo = clienteConsumo;
	}

	public Servicio getServicio() {
		return servicio;
	}

	public void setServicio(Servicio servicio) {
		this.servicio = servicio;
	}

}
