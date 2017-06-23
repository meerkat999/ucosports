package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.repository.IClienteRepository;

@RequestScoped
public class ClienteLogicalImpl extends LogicalCommonImpl<Cliente, ClienteDTO> implements IClienteLogical {

	@Inject
	private IClienteRepository repository;

	@Override
	public Cliente getClienteById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cliente> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cliente addCliente(Cliente player) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClienteDTO buildDTO(Cliente entity) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
