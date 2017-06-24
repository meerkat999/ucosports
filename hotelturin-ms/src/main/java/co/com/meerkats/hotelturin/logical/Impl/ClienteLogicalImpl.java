package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteKey;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.repository.IClienteRepository;

@RequestScoped
public class ClienteLogicalImpl extends LogicalCommonImpl<Cliente, ClienteDTO> implements IClienteLogical {

	@Inject
	private IClienteRepository repository;

	@Override
	public List<ClienteDTO> getAll() {
		List<Cliente> listaClientes = repository.findAll();
		return listEntitiesToListDTOs(listaClientes);
	}

	@Override
	public ClienteDTO buildDTO(Cliente entity) {
		ClienteDTO clienteDTO = new ClienteDTO();
		ClienteKeyDTO id = new ClienteKeyDTO();
		id.setId(entity.getId().getId());
		id.setTipodocumento(entity.getId().getTipoDocumento());
		clienteDTO.setId(id);
		clienteDTO.setNombreCompleto(entity.getNombreCompleto());
		return clienteDTO;
	}

	@Override
	public ClienteDTO getById(ClienteKeyDTO key) {
		ClienteKey keyEntity = new ClienteKey();
		keyEntity.setId(key.getId());
		keyEntity.setTipoDocumento(key.getTipodocumento());
		Cliente cliente = repository.getOne(keyEntity);
		return buildDTO(cliente);
	}
	
	

}
