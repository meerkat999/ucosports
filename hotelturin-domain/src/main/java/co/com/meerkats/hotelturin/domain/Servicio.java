package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="servicioadicional")
public class Servicio implements Serializable {	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="servicioadicional_id")
	private String id;
	
	@Column(name="servicioadicional_nombre")
	private String nombre;
	
	@Column(name="serivicioadional_valor")
	private Double valor;
	
	@Column(name="estado_id")
	private Integer estado;	
}
