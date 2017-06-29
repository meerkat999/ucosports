package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Servicio;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.ListServicioDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;
import co.com.meerkats.hotelturin.logical.IServicioLogical;
import co.com.meerkats.hotelturin.repository.IServicioRepository;

@RequestScoped
public class ServicioLogicalImpl extends LogicalCommonImpl<Servicio,ServicioDTO> implements IServicioLogical {

	@Inject
	private IServicioRepository repository;

	@Override
	public List<ServicioDTO> getAll() {
		List<Servicio> listaServicios = repository.findAll();
		return listEntitiesToListDTOs(listaServicios);
	}

	@Override
	public ListServicioDTO getByState(EstadoDTO estado) {
		ListServicioDTO  listServicioDTO = null;
		Integer estado_id = estado.getId();
		if(estado_id !=null){
			listServicioDTO  = new ListServicioDTO();
			List<Servicio> listaServicios = repository.findByEstado(estado_id);
			List<ServicioDTO> listEntitiesToListDTOs = listEntitiesToListDTOs(listaServicios);
			listServicioDTO.setlistaServicios(listEntitiesToListDTOs);
		}	
		return listServicioDTO;
	}

	@Override
	public ServicioDTO buildDTO(Servicio entity) {
		ServicioDTO  servicioDTO = null;
		if(entity != null && entity.getId() != null){
			servicioDTO = new ServicioDTO();				
			servicioDTO.setId(entity.getId());
			servicioDTO.setValor(entity.getValor());
			servicioDTO.setNombre(entity.getNombre());
			servicioDTO.setEstado(entity.getEstado());
		}
		return servicioDTO;
	
	}

	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	@Override
	public ServicioDTO add(ServicioDTO serviciodto) throws Exception {
		Servicio servicio = new Servicio();			
		servicio.setEstado(StatesEnum.ACTIVO.getValue());
		servicio.setValor(serviciodto.getValor());		
		servicio.setNombre(serviciodto.getNombre());		
		return buildDTO(repository.save(servicio));
		
	}
	@Override
	public ServicioDTO getById(ServicioDTO serviciodto) {
		Servicio servicio=null;
		Integer servicio_id=serviciodto.getId();
		if(servicio_id != null){
			servicio= repository.findOne(servicio_id);
		}	
		return buildDTO(servicio);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ServicioDTO update(ServicioDTO servicio) throws Exception {
		Servicio servicioEntity = repository.findById(servicio.getId());
		if(servicioEntity == null){
			throw new Exception("Error, se está intentando editar un servicio inexistente");
		}
		servicioEntity.setEstado(servicio.getEstado());
		servicioEntity.setNombre(servicio.getNombre());
		servicioEntity.setValor(servicio.getValor());
		servicioEntity = repository.save(servicioEntity);
		if(servicioEntity == null){
			throw new Exception("Error al intentar editar el servicio.");
		}
		return buildDTO(repository.save(servicioEntity));
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ServicioDTO desactivar(ServicioDTO servicio) throws Exception {
		Servicio servicioEntity = repository.findById(servicio.getId());
		if(servicioEntity == null){
			throw new Exception("Error, se está intentando editar un servicio inexistente");
		}
		servicioEntity.setEstado(StatesEnum.INACTIVO.getValue());		
		servicioEntity = repository.save(servicioEntity);
		if(servicioEntity == null){
			throw new Exception("Error al desactivar el servicio.");
		}
		return buildDTO(repository.save(servicioEntity));
	}
	
	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ServicioDTO activar(ServicioDTO servicio) throws Exception {
		Servicio servicioEntity = repository.findById(servicio.getId());
		if(servicioEntity == null){
			throw new Exception("Error, se está intentando editar un servicio inexistente");
		}
		servicioEntity.setEstado(StatesEnum.ACTIVO.getValue());		
		servicioEntity = repository.save(servicioEntity);
		if(servicioEntity == null){
			throw new Exception("Error al Activar el servicio.");
		}
		return buildDTO(repository.save(servicioEntity));
	}







}
