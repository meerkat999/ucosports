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
@Table(name="clienteConsumo") 
public class ClienteConsumo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="clienteconsumo_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumns({
		@JoinColumn(name = "cliente_id", referencedColumnName = "cliente_id"),
		@JoinColumn(name = "tipodocumento_id", referencedColumnName = "tipodocumento_id")
	})
	private Cliente cliente;
	
	@Column(name = "clienteconsumo_saldo")
	private Double saldo;
	
	@Column(name = "clienteconsumo_total")
	private Double total;
	
	@Column(name = "clienteconsumo_fecha")
	private Date fecha;
	
	@ManyToOne
	@JoinColumn(name="estado_id")
	private Estado estado;

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

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	
	
	
	
}
