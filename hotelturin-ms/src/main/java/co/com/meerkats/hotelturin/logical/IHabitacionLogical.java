package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;

public interface IHabitacionLogical extends ILogicalCommon<Habitacion,HabitacionDTO> {
	
	HabitacionDTO getbyEstate(Estado estado);
	List<HabitacionDTO> getAll();

}
