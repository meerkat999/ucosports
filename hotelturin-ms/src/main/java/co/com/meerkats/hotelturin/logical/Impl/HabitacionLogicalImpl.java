package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.domain.Servicio;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;
import co.com.meerkats.hotelturin.dto.ListHabitacionDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;
import co.com.meerkats.hotelturin.logical.IHabitacionLogical;
import co.com.meerkats.hotelturin.repository.IHabitacionRepository;

@RequestScoped
public class HabitacionLogicalImpl extends LogicalCommonImpl<Habitacion,HabitacionDTO> implements IHabitacionLogical {

	@Inject
	private IHabitacionRepository repository;

	@Override
	public List<HabitacionDTO> getAll() {		
		return listEntitiesToListDTOs(repository.findAll());
	}

	@Override
	public ListHabitacionDTO getByState(EstadoDTO estado) {
		ListHabitacionDTO listHabitacionDTO = null;
		Integer estado_id = estado.getId();
		if(estado_id !=null){
			listHabitacionDTO = new ListHabitacionDTO();
			List<Habitacion> listaHabitaciones = repository.findByEstado(estado_id);
			List<HabitacionDTO> listEntitiesToListDTOs = listEntitiesToListDTOs(listaHabitaciones);
			listHabitacionDTO.setListaHabitaciones(listEntitiesToListDTOs);
		}	
		return listHabitacionDTO;
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
			habitacionDTO.setNombre(entity.getNombre());
		}
		return habitacionDTO;
	
	}
	
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	@Override
	public HabitacionDTO add(HabitacionDTO habitaciondto) throws Exception {
		Habitacion habitacion = new Habitacion();		
		if(repository.findOne(habitaciondto.getId()) != null){
			throw new Exception("Ya existe una Habitacion con ese Numero.");
		}
		habitacion.setCapacidad(habitaciondto.getCapacidad());
		habitacion.setDescripcion(habitaciondto.getDescripcion());		
		habitacion.setEstado(StatesEnum.ACTIVO.getValue());
		habitacion.setPrecio(habitaciondto.getPrecio());		
		habitacion.setId(habitaciondto.getId());
		habitacion.setNombre(habitaciondto.getNombre());
		return buildDTO(repository.save(habitacion));
		
	}

	@Override
	public HabitacionDTO getById(HabitacionDTO habitaciondto) {
		Habitacion habitacion=null;
		String habitacion_id=habitaciondto.getId();
		if(habitacion_id != null){
			habitacion= repository.findOne(habitacion_id);
		}	
		return buildDTO(habitacion);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public HabitacionDTO ocuparHabitacion(HabitacionDTO habitacionDTO) throws Exception {
		return updateEstado(habitacionDTO, StatesEnum.ACTIVO, StatesEnum.OCUPADA);
	}
	
	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public HabitacionDTO desocuparHabitacion(HabitacionDTO habitacionDTO) throws Exception {
		return updateEstado(habitacionDTO, StatesEnum.OCUPADA, StatesEnum.ACTIVO);
	}

	private HabitacionDTO updateEstado(HabitacionDTO habitacionDTO, StatesEnum oldStateRequired, StatesEnum newStateRequired) throws Exception {
		HabitacionDTO dto;
		Habitacion habitacion = validarExistenciaHabitacion(habitacionDTO);
		if(!oldStateRequired.getValue().equals(habitacion.getEstado())){
			throw new Exception("Error al intentar desocupar/ocupar una habitación que no está ocupada.");
		}
		habitacion.setEstado(newStateRequired.getValue());
		dto = buildDTO(repository.save(habitacion));
		return dto;
	}

	private Habitacion validarExistenciaHabitacion(HabitacionDTO habitacionDTO) throws Exception {
		if(habitacionDTO == null || habitacionDTO.getId() == null){
			throw new Exception("Error al intentar cambiar el estado a una habitación con un dto nulo.");
		}
		Habitacion habitacion = repository.findOne(habitacionDTO.getId());
		if(habitacion == null){
			throw new Exception("Error al intentar cambiar el estado una habitación inexistente.");
		}
		return habitacion;
	}


	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public HabitacionDTO update(HabitacionDTO habitacionDTO) throws Exception {
		Habitacion habitacionEntity = repository.findById(habitacionDTO.getId());
		if(habitacionEntity == null){
			throw new Exception("Error, se está intentando editar una habitacion inexistente");
		}
		habitacionEntity.setId(habitacionDTO.getId());
		habitacionEntity.setEstado(habitacionDTO.getEstado());
		habitacionEntity.setNombre(habitacionDTO.getNombre());
		habitacionEntity.setPrecio(habitacionDTO.getPrecio());
		habitacionEntity.setCapacidad(habitacionDTO.getCapacidad());
		habitacionEntity.setDescripcion(habitacionDTO.getDescripcion());		
		habitacionEntity = repository.save(habitacionEntity);
		if(habitacionEntity == null){
			throw new Exception("Error al intentar editar la Habitacion.");
		}
		return buildDTO(repository.save(habitacionEntity));
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public HabitacionDTO desactivar(HabitacionDTO habitacionDTO) throws Exception {
		Habitacion habitacionEntity = repository.findById(habitacionDTO.getId());
		if(habitacionEntity == null){
			throw new Exception("Error, se está intentando editar una Habitacion inexistente");
		}
		habitacionEntity.setEstado(StatesEnum.INACTIVO.getValue());		
		habitacionEntity = repository.save(habitacionEntity);
		if(habitacionEntity == null){
			throw new Exception("Error al desactivar la Habitacion.");
		}
		return buildDTO(repository.save(habitacionEntity));
	}
	
	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public HabitacionDTO activar(HabitacionDTO habitacionDTO) throws Exception {
		Habitacion habitacionEntity = repository.findById(habitacionDTO.getId());
		if(habitacionEntity == null){
			throw new Exception("Error, se está intentando editar un servicio inexistente");
		}
		habitacionEntity.setEstado(StatesEnum.ACTIVO.getValue());		
		habitacionEntity = repository.save(habitacionEntity);
		if(habitacionEntity == null){
			throw new Exception("Error al Activar el servicio.");
		}
		return buildDTO(repository.save(habitacionEntity));
	}

}

