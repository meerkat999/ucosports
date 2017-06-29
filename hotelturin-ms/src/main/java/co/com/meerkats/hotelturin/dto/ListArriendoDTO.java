package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.List;

public class ListArriendoDTO implements Serializable{

	private static final long serialVersionUID = 1L;

	private List<ArriendoDTO> listaArriendos;

	public List<ArriendoDTO> getListaArriendos() {
		return listaArriendos;
	}

	public void setListaArriendos(List<ArriendoDTO> listaArriendos) {
		this.listaArriendos = listaArriendos;
	}
	
}
