package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;

public interface IHabitacionLogical extends ILogicalCommon<Habitacion,HabitacionDTO> {
	
	List<HabitacionDTO> getAll();
	HabitacionDTO getbyEstate(EstadoDTO estado);	
	HabitacionDTO add(HabitacionDTO habitacion) throws Exception;


}
