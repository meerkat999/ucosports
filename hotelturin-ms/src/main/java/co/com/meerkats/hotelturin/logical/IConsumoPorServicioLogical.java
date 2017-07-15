package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.ConsumoPorServicio;
import co.com.meerkats.hotelturin.dto.ConsumoPorServicioDTO;

public interface IConsumoPorServicioLogical extends ILogicalCommon<ConsumoPorServicio, ConsumoPorServicioDTO> {

	
	ConsumoPorServicioDTO save(ConsumoPorServicioDTO consumoPorServicioDTO) throws Exception;

	List<ConsumoPorServicioDTO> save(List<ConsumoPorServicioDTO> consumos) throws Exception;

	List<ConsumoPorServicioDTO> findByClienteConsumo(Integer clienteconsumoId);

	
}
