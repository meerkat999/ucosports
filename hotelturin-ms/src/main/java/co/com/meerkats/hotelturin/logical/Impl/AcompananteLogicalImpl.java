package co.com.meerkats.hotelturin.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Acompanante;
import co.com.meerkats.hotelturin.dto.AcompananteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.TipoDocumentoDTO;
import co.com.meerkats.hotelturin.logical.IAcompananteLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.ITipoDocumentoLogical;
import co.com.meerkats.hotelturin.repository.IAcompananteRepository;

@RequestScoped
public class AcompananteLogicalImpl extends LogicalCommonImpl<Acompanante, AcompananteDTO> implements IAcompananteLogical {

	@Inject
	private IAcompananteRepository repository;
	
	@Inject
	private ITipoDocumentoLogical tipoDocumentoLogical;
	
	@Inject
	private IClienteLogical clienteLogical;
	
	@Override
	public AcompananteDTO buildDTO(Acompanante entity) {
		AcompananteDTO dto = null;
		if(entity != null & entity.getId() != null){
			dto = new AcompananteDTO();
			dto.setId(entity.getId());
			dto.setArriendoId(entity.getArriendoId());
			dto.setTipoDocumentoId(entity.getTipoDocumentoId());
			dto.setCedulaId(entity.getClienteId());
		}
		return null;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public AcompananteDTO add(AcompananteDTO acompananteDTO) throws Exception {
		AcompananteDTO dto = null;
		if(acompananteDTO != null){
			validarAcompanante(acompananteDTO);
			Acompanante acompanante = new Acompanante();
			acompanante.setArriendoId(acompananteDTO.getArriendoId());
			acompanante.setClienteId(acompananteDTO.getCedulaId());
			acompanante.setTipoDocumentoId(acompananteDTO.getTipoDocumentoId());
			dto = buildDTO(repository.save(acompanante));
		}
		return dto;
	}

	private void validarAcompanante(AcompananteDTO acompananteDTO) throws Exception {
		TipoDocumentoDTO documentoDTO = new TipoDocumentoDTO();
		documentoDTO.setId(acompananteDTO.getTipoDocumentoId());
		if(tipoDocumentoLogical.getById(documentoDTO) == null){
			throw new Exception("Error al intentar guardar un arriendo con un acompanante con tipo de identificación inválido.");
		}
		ClienteKeyDTO clienteKeyDTO = new ClienteKeyDTO();
		clienteKeyDTO.setId(acompananteDTO.getCedulaId());
		clienteKeyDTO.setTipodocumento(acompananteDTO.getTipoDocumentoId());
		if(clienteLogical.getById(clienteKeyDTO) == null){
			throw new Exception("Error al intentar guardar un arriendo con un acompanante inexistente.");
		}
	}

}
