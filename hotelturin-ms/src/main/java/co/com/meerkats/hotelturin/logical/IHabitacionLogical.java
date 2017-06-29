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
	HabitacionDTO desocuparHabitacion(HabitacionDTO habitacionDTO) throws Exception;
	HabitacionDTO update(HabitacionDTO habitacion) throws Exception;
	HabitacionDTO activar(HabitacionDTO habitacion) throws Exception;
	HabitacionDTO desactivar(HabitacionDTO habitacion) throws Exception;
}
