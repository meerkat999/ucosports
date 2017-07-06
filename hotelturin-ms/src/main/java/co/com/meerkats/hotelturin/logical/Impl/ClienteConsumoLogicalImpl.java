package co.com.meerkats.hotelturin.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;
import co.com.meerkats.hotelturin.repository.IClienteConsumoRepository;

@RequestScoped
public class ClienteConsumoLogicalImpl extends LogicalCommonImpl<ClienteConsumo, ClienteConsumoDTO> implements IClienteConsumoLogical {

	@Inject
	private IClienteConsumoRepository repository;
	
	@Override
	public ClienteConsumoDTO buildDTO(ClienteConsumo entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClienteConsumo> findAll() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

}
