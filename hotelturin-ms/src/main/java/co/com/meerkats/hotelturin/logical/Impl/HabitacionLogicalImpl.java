package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteKey;
import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;
import co.com.meerkats.hotelturin.logical.IHabitacionLogical;
import co.com.meerkats.hotelturin.repository.IHabitacionRepository;

@RequestScoped
public class HabitacionLogicalImpl extends LogicalCommonImpl<Habitacion,HabitacionDTO> implements IHabitacionLogical {

	@Inject
	private IHabitacionRepository repository;

	@Override
	public List<HabitacionDTO> getAll() {
		List<Habitacion> listaHabitaciones = repository.findAll();
		return listEntitiesToListDTOs(listaHabitaciones);
	}

	@Override
	public HabitacionDTO getbyEstate(Estado estado) {
		Estado estado1 = new Estado();
		estado1.setId(estado.getId());
		estado1.setNombre(estado.getNombre());
		Habitacion habitacion= repository.findAll(estado1);
		return buildDTO(habitacion);
	}

	@Override
	public HabitacionDTO buildDTO(Habitacion entity) {
		HabitacionDTO  habitacionDTO = null;
		if(entity != null){
			habitacionDTO = new HabitacionDTO();				
			habitacionDTO.setId(entity.getId());
			habitacionDTO.setPrecio(entity.getPrecio());
			habitacionDTO.setEstado(entity.getEstado());
			habitacionDTO.setCapacidad(entity.getCapacidad());
			habitacionDTO.setDescripcion(entity.getDescripcion());			
		}
		return habitacionDTO;
	}

}
