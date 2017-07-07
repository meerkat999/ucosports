package co.com.meerkats.hotelturin.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.domain.ConsumoPorServicio;
import co.com.meerkats.hotelturin.domain.Servicio;
import co.com.meerkats.hotelturin.dto.ConsumoPorServicioDTO;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;
import co.com.meerkats.hotelturin.logical.IConsumoPorServicioLogical;
import co.com.meerkats.hotelturin.logical.IServicioLogical;
import co.com.meerkats.hotelturin.repository.IConsumoPorServicioRepository;

@RequestScoped
public class ConsumoPorServicioLogicalImpl extends LogicalCommonImpl<ConsumoPorServicio, ConsumoPorServicioDTO> implements IConsumoPorServicioLogical {

	@Inject
	private IConsumoPorServicioRepository repository;
	
	@Inject
	private IClienteConsumoLogical clienteConsumoLogical;
	
	@Inject
	private IServicioLogical servicioLogical;
	
	@Override
	public ConsumoPorServicioDTO buildDTO(ConsumoPorServicio entity) {
		ConsumoPorServicioDTO consumoPorServicioDTO = null;
		if(entity != null && entity.getId() != null){
			consumoPorServicioDTO = new ConsumoPorServicioDTO();
			consumoPorServicioDTO.setClienteConsumoId(entity.getClienteConsumo().getId());
			consumoPorServicioDTO.setServicioAdicionalId(entity.getServicio().getId());
			consumoPorServicioDTO.setServicioAdicionalValor(entity.getServicioValor());
		}
		return consumoPorServicioDTO;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ConsumoPorServicioDTO save(ConsumoPorServicioDTO consumoPorServicioDTO) throws Exception {
		if(consumoPorServicioDTO == null){
			throw new Exception("Error al guardar consumosporservicio con un dto nulo.");
		}
		
		ClienteConsumo clienteConsumo = clienteConsumoLogical.getEntityForOtherEntity(consumoPorServicioDTO.getClienteConsumoId());
		Servicio servicio = servicioLogical.getEntityForOtherEntity(consumoPorServicioDTO.getServicioAdicionalId());
		
		ConsumoPorServicio consumoPorServicio = new ConsumoPorServicio();
		consumoPorServicio.setClienteConsumo(clienteConsumo);
		consumoPorServicio.setServicio(servicio);
		consumoPorServicio.setServicioValor(servicio.getValor());
		
		consumoPorServicio = repository.save(consumoPorServicio);
		
		if(consumoPorServicio == null){
			throw new Exception("Error al guardar consumosporservicio.");
		}
		
		return buildDTO(consumoPorServicio);
	}


}
