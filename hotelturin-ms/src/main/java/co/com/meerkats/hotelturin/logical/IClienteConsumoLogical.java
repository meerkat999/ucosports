package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;

public interface IClienteConsumoLogical extends ILogicalCommon<ClienteConsumo, ClienteConsumoDTO> {

	ClienteConsumo save(ClienteConsumoDTO clienteConsumoDTO, Integer estadoId) throws Exception;

	ClienteConsumo getEntityForOtherEntity(Integer clienteConsumoId) throws Exception;

	ClienteConsumoDTO update(ClienteConsumoDTO clienteConsumoDTO) throws Exception;
	
	ClienteConsumoDTO getById(ClienteConsumoDTO clienteConsumoDTO);

	ClienteConsumoDTO addorupdate(ClienteConsumoDTO consumo) throws Exception;

	ClienteConsumoDTO getClienteConsumoByClienteIdAndTipodocumentoidDTO(String clienteId, Integer tipodocumentoId)
			throws Exception;


}
