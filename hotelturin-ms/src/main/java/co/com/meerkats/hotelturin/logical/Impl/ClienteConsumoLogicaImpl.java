package co.com.meerkats.hotelturin.logical.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;
import co.com.meerkats.hotelturin.dto.ConsumoPorServicioDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.IConsumoPorServicioLogical;
import co.com.meerkats.hotelturin.logical.IEstadoLogical;
import co.com.meerkats.hotelturin.logical.IServicioLogical;
import co.com.meerkats.hotelturin.repository.IClienteConsumoRepository;

@RequestScoped
public class ClienteConsumoLogicaImpl extends LogicalCommonImpl<ClienteConsumo, ClienteConsumoDTO> implements IClienteConsumoLogical {

	@Inject
	private IClienteConsumoRepository repository;
	
	@Inject
	private IClienteLogical clienteLogical;
	
	@Inject
	private IEstadoLogical estadoLogical;
	
	@Inject
	private IServicioLogical servicioLogical;
	
	@Inject
	private IConsumoPorServicioLogical consumoporservicioLogical;
	
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
			List<ConsumoPorServicioDTO> findByClienteConsumo = consumoporservicioLogical.findByClienteConsumo(entity.getId());
			List<ServicioDTO> listaServiciosDTO = new ArrayList<>();
			for (ConsumoPorServicioDTO consumoPorServicioDTO : findByClienteConsumo) {
				ServicioDTO servicio = new ServicioDTO();
				servicio.setId(consumoPorServicioDTO.getServicioAdicionalId());
				listaServiciosDTO.add(servicioLogical.getById(servicio));
			}
			clienteConsumoDTO.setConsumos(listaServiciosDTO);
		}
		return clienteConsumoDTO;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ClienteConsumo save(ClienteConsumoDTO clienteConsumoDTO, Integer estadoId) throws Exception {
		if(clienteConsumoDTO == null){
			throw new Exception("Error al intentar guardar un cliente consumo con el dto nulo.");
		}
		
		Cliente cliente = clienteLogical.getEntityForOtherEntity(clienteConsumoDTO.getClienteId(), clienteConsumoDTO.getTipodocumentoId());
		Estado estado = estadoLogical.getEntityForOtherEntity(estadoId);
		
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


	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ClienteConsumoDTO addorupdate(ClienteConsumoDTO clienteConsumoDTO) throws Exception {
		ClienteConsumo clienteConsumo = getClienteConsumoByClienteIdAndTipodocumentoid(clienteConsumoDTO.getClienteId(), clienteConsumoDTO.getTipodocumentoId());
		if(clienteConsumo == null || clienteConsumo.getId() == null){
			clienteConsumo = save(clienteConsumoDTO,StatesEnum.ACTIVO.getValue());	
		}
		Double valor = 0D;
		List<ServicioDTO> listaServiciosAConsumir = clienteConsumoDTO.getConsumos();
		List<ConsumoPorServicioDTO> listaServiciosAConsumirPersistidos = new ArrayList<>();
		for (ServicioDTO servicioDTO : listaServiciosAConsumir) {
			ConsumoPorServicioDTO consumoPorServicioDTO = new ConsumoPorServicioDTO();
			consumoPorServicioDTO.setClienteConsumoId(clienteConsumo.getId());
			consumoPorServicioDTO.setServicioAdicionalId(servicioDTO.getId());
			consumoPorServicioDTO.setServicioAdicionalValor(consumoPorServicioDTO.getServicioAdicionalValor());
			listaServiciosAConsumirPersistidos.add(consumoPorServicioDTO);
			valor += servicioDTO.getValor();
		}
		
		consumoporservicioLogical.save(listaServiciosAConsumirPersistidos);
		
		if(clienteConsumo.getTotal() != null){
			clienteConsumo.setTotal(clienteConsumo.getTotal() + valor);
		}else{
			clienteConsumo.setTotal(valor);
		}
		if(clienteConsumo.getSaldo() != null){
			clienteConsumo.setSaldo(clienteConsumo.getSaldo() + valor);	
		}else{
			clienteConsumo.setSaldo(valor);
		}
		
		clienteConsumo = repository.save(clienteConsumo);
		
		if(clienteConsumo == null){
			throw new Exception("No se pudo guardar el cliente consumo.");
		}
		
		return buildDTO(clienteConsumo);
	}

	private ClienteConsumo getClienteConsumoByClienteIdAndTipodocumentoid(String clienteId, Integer tipodocumentoId) throws Exception {
		Cliente cliente = clienteLogical.getEntityForOtherEntity(clienteId, tipodocumentoId);
		Estado estado = estadoLogical.getEntityForOtherEntity(StatesEnum.ACTIVO.getValue());
		return repository.findByClienteAndEstado(cliente.getId().getId(), cliente.getId().getTipoDocumento(), estado.getId());
	}
	
	@Override
	public ClienteConsumoDTO getClienteConsumoByClienteIdAndTipodocumentoidDTO(String clienteId, Integer tipodocumentoId) throws Exception {
		return buildDTO(getClienteConsumoByClienteIdAndTipodocumentoid(clienteId, tipodocumentoId));
	}

}
