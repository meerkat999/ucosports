package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;

public interface IClienteConsumoLogical extends ILogicalCommon<ClienteConsumo, ClienteConsumoDTO> {

	ClienteConsumo save(ClienteConsumoDTO clienteConsumoDTO) throws Exception;

	ClienteConsumo getEntityForOtherEntity(Integer clienteConsumoId) throws Exception;

	ClienteConsumoDTO update(ClienteConsumoDTO clienteConsumoDTO) throws Exception;
	
	ClienteConsumoDTO getById(ClienteConsumoDTO clienteConsumoDTO);


}
