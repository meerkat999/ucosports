package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;

import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
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
	public HabitacionDTO getbyEstate(EstadoDTO estado) {
		Habitacion habitacion = null;
		Integer estado_id = estado.getId();
		if(estado_id !=null){
			habitacion= repository.findByEstado(estado_id);
		}	
		return buildDTO(habitacion);
	}

	@Override
	public HabitacionDTO buildDTO(Habitacion entity) {
		HabitacionDTO  habitacionDTO = null;
		if(entity != null && entity.getId() != null){
			habitacionDTO = new HabitacionDTO();				
			habitacionDTO.setId(entity.getId());
			habitacionDTO.setPrecio(entity.getPrecio());
			habitacionDTO.setEstado(entity.getEstado());
			habitacionDTO.setCapacidad(entity.getCapacidad());
			habitacionDTO.setDescripcion(entity.getDescripcion());			
		}
		return habitacionDTO;
	
	}
	
	@Transactional
	@Override
	public HabitacionDTO add(HabitacionDTO habitaciondto) throws Exception {
		Habitacion habitacion = new Habitacion();		
		if(repository.findOne(habitacion.getId()) != null){
			throw new Exception("Ya existe una Habitacion con ese Numero.");
		}
		habitacion.setCapacidad(habitaciondto.getCapacidad());;
		habitacion.setDescripcion(habitaciondto.getDescripcion());		
		habitacion.setEstado(habitaciondto.getEstado());
		habitacion.setPrecio(habitaciondto.getPrecio());		
		habitaciondto.setId(habitaciondto.getId());		
		return buildDTO(repository.save(habitacion));
		
	}

		}

