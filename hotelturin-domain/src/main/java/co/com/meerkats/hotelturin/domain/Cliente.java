package co.com.meerkats.hotelturin.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="cliente")
public class Cliente implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	private ClienteKey id;
	
	@Column(name = "cliente_nombre_completo")
	private String nombreCompleto;
	
	@Column(name = "cliente_celular")
	private Long celular;
	
	@Column(name = "cliente_fecha_registro")
	private Date fechaRegistro;
	
	@Column(name = "cliente_apellido1")
	private String apellidoUno;
	
	@Column(name = "cliente_nombre1")
	private String nombreUno;
	
	@Column(name = "cliente_fecha_nacimiento")
	private Date fechaNacimiento;
	
	@Column(name = "cliente_correo")
	private String correo;
	
	@Column(name = "cliente_apellido2")
	private String apellidoDos;
	
	@Column(name = "cliente_nombre2")
	private String nombreDos;

	public ClienteKey getId() {
		return id;
	}

	public void setId(ClienteKey id) {
		this.id = id;
	}

	public String getNombreCompleto() {
		return nombreCompleto;
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	public Long getCelular() {
		return celular;
	}

	public void setCelular(Long celular) {
		this.celular = celular;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public String getApellidoUno() {
		return apellidoUno;
	}

	public void setApellidoUno(String apellidoUno) {
		this.apellidoUno = apellidoUno;
	}

	public String getNombreUno() {
		return nombreUno;
	}

	public void setNombreUno(String nombreUno) {
		this.nombreUno = nombreUno;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getApellidoDos() {
		return apellidoDos;
	}

	public void setApellidoDos(String apellidoDos) {
		this.apellidoDos = apellidoDos;
	}

	public String getNombreDos() {
		return nombreDos;
	}

	public void setNombreDos(String nombreDos) {
		this.nombreDos = nombreDos;
	}
	
}
