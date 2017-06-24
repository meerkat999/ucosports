package co.com.meerkats.hotelturin.logical.Impl;

import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

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
		ClienteDTO clienteDTO = null;
		if(entity != null && entity.getId() != null){
			clienteDTO = new ClienteDTO();
			ClienteKeyDTO id = new ClienteKeyDTO();
			id.setId(entity.getId().getId());
			id.setTipodocumento(entity.getId().getTipoDocumento());
			clienteDTO.setId(id);
			clienteDTO.setNombreCompleto(entity.getNombreCompleto());
			clienteDTO.setCelular(entity.getCelular());
			clienteDTO.setApellidoUno(entity.getApellidoUno());
			clienteDTO.setNombreUno(entity.getNombreUno());
			clienteDTO.setFechaRegistro(entity.getFechaRegistro());
		}
		return clienteDTO;
	}

	@Override
	public ClienteDTO getById(ClienteKeyDTO key) {
		ClienteKey keyEntity = new ClienteKey();
		keyEntity.setId(key.getId());
		keyEntity.setTipoDocumento(key.getTipodocumento());
		Cliente cliente = repository.findOne(keyEntity);
		return buildDTO(cliente);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ClienteDTO add(ClienteDTO clientedto) {
		Cliente cliente = new Cliente();
		cliente.setApellidoUno(clientedto.getApellidoUno());
		cliente.setCelular(clientedto.getCelular());
		cliente.setNombreUno(clientedto.getNombreUno());
		ClienteKey id = new ClienteKey();
		id.setId(clientedto.getId().getId());
		id.setTipoDocumento(clientedto.getId().getTipodocumento());
		cliente.setId(id);
		cliente.setFechaRegistro(new Date());
		cliente.setNombreCompleto(clientedto.getNombreUno() + " " + clientedto.getApellidoUno());	
		return buildDTO(repository.save(cliente));
	}
	
	

}
