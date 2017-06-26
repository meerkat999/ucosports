package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.List;

public class ListHabitacionDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private List<HabitacionDTO> listaHabitaciones;

	public List<HabitacionDTO> getListaHabitaciones() {
		return listaHabitaciones;
	}

	public void setListaHabitaciones(List<HabitacionDTO> listaHabitaciones) {
		this.listaHabitaciones = listaHabitaciones;
	}

}
