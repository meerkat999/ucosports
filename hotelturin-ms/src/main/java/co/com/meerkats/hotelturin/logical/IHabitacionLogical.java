package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;

public interface IHabitacionLogical extends ILogicalCommon<Habitacion,HabitacionDTO> {
	
	List<HabitacionDTO> getAll();
<<<<<<< Updated upstream
	HabitacionDTO getbyEstate(EstadoDTO estado);
=======
	HabitacionDTO getbyEstate(Integer estado_id);
	HabitacionDTO add(HabitacionDTO habitacion);
>>>>>>> Stashed changes

}
