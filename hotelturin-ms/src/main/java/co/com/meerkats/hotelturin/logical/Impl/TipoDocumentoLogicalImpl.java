package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.hotelturin.domain.TipoDocumento;
import co.com.meerkats.hotelturin.dto.TipoDocumentoDTO;
import co.com.meerkats.hotelturin.logical.ITipoDocumentoLogical;
import co.com.meerkats.hotelturin.repository.ITipoDocumentoRepository;

@RequestScoped
public class TipoDocumentoLogicalImpl extends LogicalCommonImpl<TipoDocumento, TipoDocumentoDTO> implements ITipoDocumentoLogical {

	@Inject
	private ITipoDocumentoRepository repository;
	
	@Override
	public List<TipoDocumentoDTO> getAll() {
		return listEntitiesToListDTOs(repository.findAll());
	}

	@Override
	public TipoDocumentoDTO buildDTO(TipoDocumento entity) {
		TipoDocumentoDTO documentoDTO = null;
		if(entity != null && entity.getId() != null){
			documentoDTO = new TipoDocumentoDTO();
			documentoDTO.setId(entity.getId());
			documentoDTO.setNombre(entity.getNombre());
		}
		return documentoDTO;
	}

	@Override
	public TipoDocumentoDTO getById(TipoDocumentoDTO documentoDTO) {
		TipoDocumentoDTO dto = null;
		if(documentoDTO != null && documentoDTO.getId() != null){
			dto = buildDTO(repository.findOne(documentoDTO.getId()));
		}
		return dto;
	}

}
