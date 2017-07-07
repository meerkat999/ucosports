package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Acompanante;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.AcompananteDTO;
import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.logical.IAcompananteLogical;
import co.com.meerkats.hotelturin.logical.IArriendoLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.repository.IAcompananteRepository;

@RequestScoped
public class AcompananteLogicalImpl extends LogicalCommonImpl<Acompanante, AcompananteDTO> implements IAcompananteLogical {

	@Inject
	private IAcompananteRepository repository;
	
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
		return dto;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public AcompananteDTO add(AcompananteDTO acompananteDTO) throws Exception {
		AcompananteDTO dto = null;
		validar(acompananteDTO);
		Acompanante acompanante = new Acompanante();
		acompanante.setArriendoId(acompananteDTO.getArriendoId());
		acompanante.setClienteId(acompananteDTO.getCedulaId());
		acompanante.setTipoDocumentoId(acompananteDTO.getTipoDocumentoId());
		dto = buildDTO(repository.save(acompanante));
		return dto;
	}

	private void validar(AcompananteDTO acompananteDTO) throws Exception {
		validarDTO(acompananteDTO);
		validarArriendo(acompananteDTO);
		clienteLogical.validarTipoDocumentoYCliente(acompananteDTO.getCedulaId(), acompananteDTO.getTipoDocumentoId());
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

	@Override
	public AcompananteDTO searchAcompananteCheckInActive(AcompananteDTO acompananteDTO) {
		AcompananteDTO dto = null;
		if(acompananteDTO != null){
			List<AcompananteDTO> byClienteWithArriendoActive = getByClienteWithArriendoActive(acompananteDTO);
			if(byClienteWithArriendoActive != null){
				dto = byClienteWithArriendoActive.stream().findFirst().orElse(null);
			}
		}
		return dto;
	}

	private List<AcompananteDTO> getByClienteWithArriendoActive(AcompananteDTO acompananteDTO) {
		List<AcompananteDTO> lista = null;
		if(acompananteDTO.getCedulaId() != null && acompananteDTO.getTipoDocumentoId() != null){
			lista = listEntitiesToListDTOs(repository.findByClienteIdAndTipoDocumentoIdWithArriendoActive(acompananteDTO.getCedulaId(), acompananteDTO.getTipoDocumentoId()));
		}
		return lista;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public AcompananteDTO addAfterCheckin(AcompananteDTO acompananteDTO) throws Exception {
		validar(acompananteDTO);
		ArriendoDTO arriendoDTO = new ArriendoDTO();
		arriendoDTO.setId(acompananteDTO.getArriendoId());
		arriendoLogical.addNumAcompanantes(arriendoDTO, 1);
		return add(acompananteDTO);
	}

}
