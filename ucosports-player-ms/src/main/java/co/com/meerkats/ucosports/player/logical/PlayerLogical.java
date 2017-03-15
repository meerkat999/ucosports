package co.com.meerkats.ucosports.player.logical;

import java.util.List;

import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.player.repository.IPlayerRepository;

public class PlayerLogical {

	@Inject
	private IPlayerRepository repository;
	
	public Player findPlayerById(Integer id) {
		return repository.findOne(id);
	}

	public List<Player> findAll() {
		return repository.findAll();
	}

}
