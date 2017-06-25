package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;

public interface IHabitacionLogical extends ILogicalCommon<Habitacion,HabitacionDTO> {
	
	List<HabitacionDTO> getAll();
	HabitacionDTO getbyEstate(Integer estado_id);

}
