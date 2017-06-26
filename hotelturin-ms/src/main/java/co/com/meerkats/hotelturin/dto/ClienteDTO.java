package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.Date;

public class ClienteDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String nombreCompleto;
	
	private ClienteKeyDTO id;
	
	private Long celular;
	
	private String apellidoUno;
	
	private String nombreUno;
	
	private Date fechaNacimiento;
	
	private Date fechaRegistro;

	public String getNombreCompleto() {
		return nombreCompleto;
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	public ClienteKeyDTO getId() {
		return id;
	}

	public void setId(ClienteKeyDTO id) {
		this.id = id;
	}

	public Long getCelular() {
		return celular;
	}

	public void setCelular(Long celular) {
		this.celular = celular;
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

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	
	
}
