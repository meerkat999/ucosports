package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;

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
@Table(name="mediopagoporfactura") 
public class MedioPagoPorFactura implements Serializable {

	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="mediopagoporfactura_id")
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
	
	@ManyToOne
	@JoinColumn(name="mediodepago_id")
	private MedioPago medioPago;
	
	@ManyToOne
	@JoinColumn(name="factura_id")
	private Factura factura;
	
	@Column(name = "mediopagoporfactura_valor")
	private Double valor;
	
	@Column(name = "mediopagoporfactura_num_bauche")
	private String numBauche;

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

	public MedioPago getMedioPago() {
		return medioPago;
	}

	public void setMedioPago(MedioPago medioPago) {
		this.medioPago = medioPago;
	}

	public Factura getFactura() {
		return factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
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
