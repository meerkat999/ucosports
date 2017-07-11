package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="factura") 
public class Factura implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="factura_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumns({
		@JoinColumn(name = "cliente_id", referencedColumnName = "cliente_id"),
		@JoinColumn(name = "tipodocumento_id", referencedColumnName = "tipodocumento_id")
	})
	private Cliente cliente;
	
	@ManyToOne
	@JoinColumn(name="estado_id")
	private Estado estado;
	
	@Column(name = "factura_valor")
	private Double valor;
	
	@Column(name = "factura_devuelta")
	private Double devuelta;
	
	@Column(name = "factura_fecha")
	private Date fecha;
	
	@ManyToOne
	@JoinColumn(name="arriendo_id")
	private Arriendo arriendo;
	
	@ManyToOne
	@JoinColumn(name="habitacion_id")
	private Habitacion habitacion;
	
	@ManyToOne
	@JoinColumn(name="clienteconsumo_id")
	private ClienteConsumo clienteConsumo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Arriendo getArriendo() {
		return arriendo;
	}

	public void setArriendo(Arriendo arriendo) {
		this.arriendo = arriendo;
	}

	public Habitacion getHabitacion() {
		return habitacion;
	}

	public void setHabitacion(Habitacion habitacion) {
		this.habitacion = habitacion;
	}

	public ClienteConsumo getClienteConsumo() {
		return clienteConsumo;
	}

	public void setClienteConsumo(ClienteConsumo clienteConsumo) {
		this.clienteConsumo = clienteConsumo;
	}

	public Double getDevuelta() {
		return devuelta;
	}

	public void setDevuelta(Double devuelta) {
		this.devuelta = devuelta;
	}
	
	
	
}
