package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.List;

public class ListServicioDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private List<ServicioDTO> listaServicios;

	public List<ServicioDTO> getListaServicios() {
		return listaServicios;
	}

	public void setlistaServicios(List<ServicioDTO> listaServicios) {
		this.listaServicios = listaServicios;
	}

}
