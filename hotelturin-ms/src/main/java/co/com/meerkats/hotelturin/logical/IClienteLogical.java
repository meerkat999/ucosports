package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;

public interface IClienteLogical extends ILogicalCommon<Cliente, ClienteDTO> {

	List<ClienteDTO> getAll();

	ClienteDTO getById(ClienteKeyDTO key);
	ClienteDTO add(ClienteDTO cliente) throws Exception;
	
}
