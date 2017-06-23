package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.dto.ClienteDTO;

public interface IClienteLogical extends ILogicalCommon<Cliente, ClienteDTO> {

	Cliente getClienteById(Integer id);
	List<Cliente> findAll();
	Cliente addCliente(Cliente player);
	
}
