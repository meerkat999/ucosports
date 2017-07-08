package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mediodepago") 
public class MedioPago implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="mediodepago_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="mediodepago_nombre")
	private String nombre;
	
	@Column(name="mediodepago_need_bauche")
	private String needBauche;
	
	@Column(name="mediodepago_need_devuelta")
	private String needDevuelta;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNeedBauche() {
		return needBauche;
	}

	public void setNeedBauche(String needBauche) {
		this.needBauche = needBauche;
	}

	public Boolean isNeedBauche(){
		return "1".equals(getNeedBauche()) == true;
	}
	
	public void setIsNeedBauche(Boolean isNeed){
		this.needBauche = isNeed == true ? "1" : "0";
	}

	public String getNeedDevuelta() {
		return needDevuelta;
	}

	public void setNeedDevuelta(String needDevuelta) {
		this.needDevuelta = needDevuelta;
	}
	
	public Boolean isNeedDevuelta(){
		return "1".equals(getNeedDevuelta()) == true;
	}
	
	public void setIsNeedDevuelta(Boolean isNeed){
		this.needDevuelta = isNeed == true ? "1" : "0";
	}
	
	
	
}