package co.com.meerkats.hotelturin.logical.Impl;

import java.util.Date;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.IEstadoLogical;
import co.com.meerkats.hotelturin.repository.IClienteConsumoRepository;

@RequestScoped
public class ClienteConsumoLogicaImpl extends LogicalCommonImpl<ClienteConsumo, ClienteConsumoDTO> implements IClienteConsumoLogical {

	@Inject
	private IClienteConsumoRepository repository;
	
	@Inject
	private IClienteLogical clienteLogical;
	
	@Inject
	private IEstadoLogical estadoLogical;
	
	@Override
	public ClienteConsumoDTO buildDTO(ClienteConsumo entity) {
		ClienteConsumoDTO clienteConsumoDTO = null;
		if(entity != null && entity.getId() != null){
			clienteConsumoDTO = new ClienteConsumoDTO();
			clienteConsumoDTO.setId(entity.getId());
			clienteConsumoDTO.setEstado_id(entity.getEstado().getId());
			clienteConsumoDTO.setFecha(entity.getFecha());
			clienteConsumoDTO.setSaldo(entity.getSaldo());
			clienteConsumoDTO.setTotal(entity.getTotal());
			clienteConsumoDTO.setClienteId(entity.getCliente().getId().getId());
			clienteConsumoDTO.setTipodocumentoId(entity.getCliente().getId().getTipoDocumento());
		}
		return clienteConsumoDTO;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ClienteConsumo save(ClienteConsumoDTO clienteConsumoDTO) throws Exception {
		if(clienteConsumoDTO == null){
			throw new Exception("Error al intentar guardar un cliente consumo con el dto nulo.");
		}
		
		Cliente cliente = clienteLogical.getEntityForOtherEntity(clienteConsumoDTO.getClienteId(), clienteConsumoDTO.getTipodocumentoId());
		Estado estado = estadoLogical.getEntityForOtherEntity(StatesEnum.PAGADO.getValue());
		
		ClienteConsumo clienteConsumo = new ClienteConsumo();
		
		clienteConsumo.setCliente(cliente);
		clienteConsumo.setEstado(estado);
		clienteConsumo.setSaldo(clienteConsumoDTO.getSaldo());
		clienteConsumo.setTotal(clienteConsumoDTO.getTotal());
		clienteConsumo.setFecha(new Date());
		
		clienteConsumo = repository.save(clienteConsumo);
		
		if(clienteConsumo == null){
			throw new Exception("Error al intentar guardar un cliente.");
		}
		
		return clienteConsumo;
	}

	@Override
	public ClienteConsumo getEntityForOtherEntity(Integer clienteConsumoId) throws Exception {
		if(clienteConsumoId == null){
			throw new Exception("Error al obtener un clienteconsumo con el dto nulo.");
		}
		ClienteConsumo clienteConsumo = repository.findOne(clienteConsumoId);
		if(clienteConsumo == null){
			throw new Exception("Error al obtener un clienteconsumo inexistente.");
		}
		return clienteConsumo;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ClienteConsumoDTO update(ClienteConsumoDTO clienteConsumoDTO) throws Exception {
		
		if(clienteConsumoDTO == null){
			throw new Exception("Error al guardar un clienteconsumo con el dto nulo.");
		}
		
		ClienteConsumo clienteConsumo = getEntityForOtherEntity(clienteConsumoDTO.getId());
		Estado estado = estadoLogical.getEntityForOtherEntity(clienteConsumoDTO.getEstado_id());
		
		clienteConsumo.setTotal(clienteConsumoDTO.getTotal());
		clienteConsumo.setSaldo(clienteConsumoDTO.getSaldo());
		clienteConsumo.setEstado(estado);

		clienteConsumo = repository.save(clienteConsumo);
		
		if(clienteConsumo == null){
			throw new Exception("Error al guardar un clienteconsumo.");
		}
		
		return buildDTO(clienteConsumo);
		
	}

	@Override
	public ClienteConsumoDTO getById(ClienteConsumoDTO clienteConsumoDTO) {
		ClienteConsumo clienteConsumo = null;
		if(clienteConsumoDTO != null && clienteConsumoDTO.getId() != null){
			clienteConsumo = repository.findOne(clienteConsumoDTO.getId());
		}
		return buildDTO(clienteConsumo);
	}

}
