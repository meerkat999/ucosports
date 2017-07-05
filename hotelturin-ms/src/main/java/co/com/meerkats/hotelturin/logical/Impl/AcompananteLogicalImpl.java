package co.com.meerkats.hotelturin.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Acompanante;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.AcompananteDTO;
import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.TipoDocumentoDTO;
import co.com.meerkats.hotelturin.logical.IAcompananteLogical;
import co.com.meerkats.hotelturin.logical.IArriendoLogical;
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
	
	@Inject
	private IArriendoLogical arriendoLogical;
	
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
			validar(acompananteDTO);
			Acompanante acompanante = new Acompanante();
			acompanante.setArriendoId(acompananteDTO.getArriendoId());
			acompanante.setClienteId(acompananteDTO.getCedulaId());
			acompanante.setTipoDocumentoId(acompananteDTO.getTipoDocumentoId());
			dto = buildDTO(repository.save(acompanante));
		}
		return dto;
	}

	private void validar(AcompananteDTO acompananteDTO) throws Exception {
		validarDTO(acompananteDTO);
		validarArriendo(acompananteDTO);
		validarCliente(acompananteDTO);
	}

	
	private void validarDTO(AcompananteDTO acompananteDTO) throws Exception {
		if(acompananteDTO == null || acompananteDTO.getArriendoId() == null ||
				acompananteDTO.getCedulaId() == null || acompananteDTO.getTipoDocumentoId() == null){
			throw new Exception("Error al intentar guardar un acompanante que no con el dto incompleto");
		}
	}

	private void validarArriendo(AcompananteDTO acompananteDTO) throws Exception {
		ArriendoDTO arriendoDTO = new ArriendoDTO();
		arriendoDTO.setId(acompananteDTO.getArriendoId());
		ArriendoDTO arriendo = arriendoLogical.getById(arriendoDTO);
		if(arriendo == null){
			throw new Exception("Error al intentar guardar un acompanante con un arriendo inexistente.");
		}
		if(arriendo.getEstadoId() != StatesEnum.ACTIVO.getValue()){
			throw new Exception("Error al intentar guardar un acompanante con un arriendo que no esta activo.");
		}
	}
	
	private void validarCliente(AcompananteDTO acompananteDTO) throws Exception {
		TipoDocumentoDTO documentoDTO = new TipoDocumentoDTO();
		documentoDTO.setId(acompananteDTO.getTipoDocumentoId());
		if(tipoDocumentoLogical.getById(documentoDTO) == null){
			throw new Exception("Error al intentar guardar un acompanante con tipo de identificación inválido.");
		}
		ClienteKeyDTO clienteKeyDTO = new ClienteKeyDTO();
		clienteKeyDTO.setId(acompananteDTO.getCedulaId());
		clienteKeyDTO.setTipodocumento(acompananteDTO.getTipoDocumentoId());
		if(clienteLogical.getById(clienteKeyDTO) == null){
			throw new Exception("Error al intentar guardar un acompanante que no esta registrado/inexistente.");
		}
	}

}
