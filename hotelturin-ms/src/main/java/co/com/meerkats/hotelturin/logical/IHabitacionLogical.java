package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;
import co.com.meerkats.hotelturin.dto.ListHabitacionDTO;

public interface IHabitacionLogical extends ILogicalCommon<Habitacion,HabitacionDTO> {
	
	List<HabitacionDTO> getAll();
	ListHabitacionDTO getByState(EstadoDTO estado);	
	HabitacionDTO add(HabitacionDTO habitacion) throws Exception;
	HabitacionDTO getById(HabitacionDTO habitacion);
	HabitacionDTO ocuparHabitacion(HabitacionDTO habitacionDTO) throws Exception;
}
