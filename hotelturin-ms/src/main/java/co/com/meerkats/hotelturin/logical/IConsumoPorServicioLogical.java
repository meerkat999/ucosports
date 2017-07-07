package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.ConsumoPorServicio;
import co.com.meerkats.hotelturin.dto.ConsumoPorServicioDTO;

public interface IConsumoPorServicioLogical extends ILogicalCommon<ConsumoPorServicio, ConsumoPorServicioDTO> {

	
	ConsumoPorServicioDTO save(ConsumoPorServicioDTO consumoPorServicioDTO) throws Exception;

	
}
