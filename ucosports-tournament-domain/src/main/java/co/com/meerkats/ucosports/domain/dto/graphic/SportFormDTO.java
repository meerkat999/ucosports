package co.com.meerkats.ucosports.domain.dto.graphic;

import java.util.ArrayList;
import java.util.List;

import co.com.meerkats.ucosports.domain.dto.SportDTO;

public class SportFormDTO {
	
	private List<InputForm> listaInputs;
	private SportDTO dto;
	
	public SportFormDTO(){
		listaInputs = new ArrayList<>();
		listaInputs.add(InputForm.CREATE_TEXT("Nombre","name"));
		listaInputs.add(InputForm.CREATE_NUMBER("Número de Equipos", "numberTeams"));
		listaInputs.add(InputForm.CREATE_NUMBER("Número de Tiempos", "numberTimes"));
		listaInputs.add(InputForm.CREATE_NUMBER("Tiempo", "timeTimes"));
		this.dto = new SportDTO();
	}

	public List<InputForm> getListaInputs() {
		return listaInputs;
	}
	public void setListaInputs(List<InputForm> listaInputs) {
		this.listaInputs = listaInputs;
	}
	public SportDTO getDto() {
		return dto;
	}
	public void setDto(SportDTO dto) {
		this.dto = dto;
	}
	
}
