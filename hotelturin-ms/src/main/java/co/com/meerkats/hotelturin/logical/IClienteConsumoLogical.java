package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;

public interface IClienteConsumoLogical extends ILogicalCommon<ClienteConsumo, ClienteConsumoDTO> {

	List<ClienteConsumo> findAll();


}
