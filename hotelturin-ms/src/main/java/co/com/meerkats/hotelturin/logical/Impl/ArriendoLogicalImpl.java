package co.com.meerkats.hotelturin.logical.Impl;

import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Arriendo;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.AcompananteDTO;
import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;
import co.com.meerkats.hotelturin.dto.TipoDocumentoDTO;
import co.com.meerkats.hotelturin.logical.IAcompananteLogical;
import co.com.meerkats.hotelturin.logical.IArriendoLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.IHabitacionLogical;
import co.com.meerkats.hotelturin.logical.ITipoDocumentoLogical;
import co.com.meerkats.hotelturin.repository.IArriendoRepository;

@RequestScoped
public class ArriendoLogicalImpl extends LogicalCommonImpl<Arriendo, ArriendoDTO> implements IArriendoLogical {

	@Inject
	private IArriendoRepository repository;
	
	@Inject
	private IHabitacionLogical habitacionLogical;
	
	@Inject
	private ITipoDocumentoLogical tipoDocumentoLogical;
	
	@Inject
	private IClienteLogical clienteLogical;
	
	@Inject
	private IAcompananteLogical acompananteLogical;
	
	@Override
	public ArriendoDTO buildDTO(Arriendo entity) {
		ArriendoDTO arriendoDTO = null;
		if(entity != null && entity.getId() != null){
			arriendoDTO = new ArriendoDTO();
			arriendoDTO.setId(entity.getId());
			arriendoDTO.setClienteId(entity.getClienteId());
			arriendoDTO.setDateCheckin(entity.getDateCheckin());
			arriendoDTO.setDateCheckout(entity.getDateCheckout());
			arriendoDTO.setEstadoId(entity.getEstadoId());
			arriendoDTO.setFecha(entity.getFecha());
			arriendoDTO.setHabitacionId(entity.getHabitacionId());
			arriendoDTO.setNumeroAcompanantes(entity.getNumeroAcompanantes());
			arriendoDTO.setNumeroNoches(entity.getNumeroNoches());
			arriendoDTO.setTipodocumentoId(entity.getTipodocumentoId());
		}
		return arriendoDTO;
	}

	@Override
	public ArriendoDTO getById(ArriendoDTO arriendoDTO) {
		ArriendoDTO dto = null;
		if(arriendoDTO!= null && arriendoDTO.getId() == null){
			dto = buildDTO(repository.findOne(arriendoDTO.getId()));
		}
		return dto;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ArriendoDTO add(ArriendoDTO arriendoDTO) throws Exception {
		
		ArriendoDTO respuesta = null;
		
		if(arriendoDTO == null){
			throw new Exception("Error al intentar guardar un arriendo teniendo el dto nulo.");
		}
		
		String cedula = arriendoDTO.getClienteId();
		Integer tipodocumentoId = arriendoDTO.getTipodocumentoId();
		String habitacionId = arriendoDTO.getHabitacionId();
		List<ClienteDTO> acompanantes = arriendoDTO.getAcompanantes();
		
		validarHabitacion(habitacionId);
		validarTipoDocumentoYCliente(cedula, tipodocumentoId);
		validarCheckInActivoCliente(cedula, tipodocumentoId);

		Arriendo arriendo = new Arriendo();
		arriendo.setClienteId(arriendoDTO.getClienteId());
		arriendo.setTipodocumentoId(arriendoDTO.getTipodocumentoId());
		arriendo.setEstadoId(StatesEnum.ACTIVO.getValue());
		arriendo.setHabitacionId(arriendoDTO.getHabitacionId());
		arriendo.setDateCheckin(new Date());
		arriendo.setFecha(new Date());
		arriendo.setNumeroNoches(arriendoDTO.getNumeroNoches());
		arriendo.setNumeroAcompanantes(arriendoDTO.getAcompanantes().size());
		arriendo.setDateCheckout(null);
		arriendo = repository.save(arriendo);
		
		setAcompanantes(acompanantes, arriendo);
		
		ocuparHabitacion(habitacionId);
		
		respuesta = buildDTO(arriendo);
		return respuesta;
	}

	private void ocuparHabitacion(String habitacionId) throws Exception {
		HabitacionDTO habitacionDTO = new HabitacionDTO();
		habitacionDTO.setId(habitacionId);
		if(habitacionLogical.ocuparHabitacion(habitacionDTO) == null){
			throw new Exception("Error al ocupar una habitación en el momento de la creación del checkin.");
		}
	}

	private void setAcompanantes(List<ClienteDTO> acompanantes, Arriendo arriendo) throws Exception {
		for (ClienteDTO cliente : acompanantes) {
			AcompananteDTO acompananteDTO = new AcompananteDTO();
			acompananteDTO.setCedulaId(cliente.getId().getId());
			acompananteDTO.setTipoDocumentoId(cliente.getId().getTipodocumento());
			acompananteDTO.setArriendoId(arriendo.getId());
			acompananteLogical.add(acompananteDTO);
		}
	}

	private void validarCheckInActivoCliente(String cedula, Integer tipodocumentoId) throws Exception {
		ClienteKeyDTO keyDto = new ClienteKeyDTO();
		keyDto.setId(cedula);
		keyDto.setTipodocumento(tipodocumentoId);
		if(getByClienteKeyCheckInActive(keyDto) != null){
			throw new Exception("Error al intentar guardar un arriendo a un cliente con checkin aún activo.");
		};
	}

	private void validarTipoDocumentoYCliente(String cedula, Integer tipodocumentoId) throws Exception {
		TipoDocumentoDTO documentoDTO = new TipoDocumentoDTO();
		documentoDTO.setId(tipodocumentoId);
		if(tipoDocumentoLogical.getById(documentoDTO) == null){
			throw new Exception("Error al intentar obtener un tipo documento inexistente.");
		}
		ClienteKeyDTO keyDto = new ClienteKeyDTO();
		keyDto.setId(cedula);
		keyDto.setTipodocumento(tipodocumentoId);
		if(clienteLogical.getById(keyDto) == null){
			throw new Exception("Error al intentar obtener un cliente inexistente.");
		}
	}

	private void validarHabitacion(String habitacionId) throws Exception {
		HabitacionDTO habitacionDTO = new HabitacionDTO();
		habitacionDTO.setId(habitacionId);
		HabitacionDTO habitacionEncontrada = habitacionLogical.getById(habitacionDTO);
		if(habitacionEncontrada == null){
			throw new Exception("Error al intentar guardar un arriendo con una habitación inexistente.");
		}
		if(habitacionEncontrada.getEstado() != StatesEnum.ACTIVO.getValue()){
			throw new Exception("Error al intentar guardar un arriendo con una habitación que no está activa.");
		}
	}

	@Override
	public ArriendoDTO getByClienteKeyCheckInActive(ClienteKeyDTO clienteKeyDTO) throws Exception {
		ArriendoDTO dto = null;
		if(clienteKeyDTO != null && clienteKeyDTO.getId() != null && clienteKeyDTO.getTipodocumento() != null){
			validarTipoDocumentoYCliente(clienteKeyDTO.getId() , clienteKeyDTO.getTipodocumento());
			dto = buildDTO(repository.findByClienteIdAndTipodocumentoIdAndEstadoId(clienteKeyDTO.getId(), clienteKeyDTO.getTipodocumento(), StatesEnum.ACTIVO.getValue()));
		}
		return dto;
	}


}
