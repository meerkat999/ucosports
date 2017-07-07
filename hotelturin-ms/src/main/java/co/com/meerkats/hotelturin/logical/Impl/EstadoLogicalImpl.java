package co.com.meerkats.hotelturin.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.logical.IEstadoLogical;
import co.com.meerkats.hotelturin.repository.IEstadoRepository;

@RequestScoped
public class EstadoLogicalImpl extends LogicalCommonImpl<Estado, EstadoDTO> implements IEstadoLogical {
	
	@Inject
	private IEstadoRepository repository;
	
	@Override
	public EstadoDTO buildDTO(Estado entity) {
		EstadoDTO dto = null;
		if(entity != null && entity.getId() != null){
			dto = new EstadoDTO();
			dto.setId(entity.getId());
		}
		return dto;
	}

	@Override
	public EstadoDTO getByID(EstadoDTO estadoDTO) {
		EstadoDTO dto = null;
		if(estadoDTO != null && estadoDTO.getId() != null){
			Estado estado = repository.findOne(estadoDTO.getId());
			dto = buildDTO(estado);
		}
		return dto;
	}

	@Override
	public Estado getEntityForOtherEntity(Integer estadoId) throws Exception {
		if(estadoId == null){
			throw new Exception("No se puede obtener una entidad estado son el id nulo.");
		}
		Estado estado = repository.findOne(estadoId);
		if(estado == null){
			throw new Exception("Error al obtener un estado inexistente.");
		}
		return estado;
	}
	
	

}
