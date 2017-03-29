package co.com.meerkats.ucosports.logical.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.logical.IPlayerLogical;
import co.com.meerkats.ucosports.repository.IPlayerRepository;

@RequestScoped
public class PlayerLogicalImpl implements IPlayerLogical {

	@Inject
	private IPlayerRepository repository;
	
	@Override
	public Player findPlayerById(Integer id) {
		return repository.findOne(id);
	}

	@Override
	public List<Player> findAll() {
		return repository.findAll();
	}
	
	@Override
	public Player addPlayer(Player player){
		return repository.save(player);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public List<Player> prueba() throws Exception {
		List<Player> lista = new ArrayList<>();
		lista.add(addPlayer(new Player()));
		lista.add(addPlayer(new Player()));
		lista.add(addPlayer(new Player()));
		return lista;
	}

}
