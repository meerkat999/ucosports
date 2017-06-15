package co.com.meerkats.ucosports.logical.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.dto.PlayerDTO;
import co.com.meerkats.ucosports.logical.IPlayerLogical;
import co.com.meerkats.ucosports.logical.ITeamLogical;
import co.com.meerkats.ucosports.repository.IPlayerRepository;

@RequestScoped
public class PlayerLogicalImpl extends LogicalCommonImpl<Player, PlayerDTO> implements IPlayerLogical {

	@Inject
	private IPlayerRepository repository;
	
	@Inject
	private ITeamLogical teamLogical;
	
	@Override
	public Player findPlayerById(Integer id) {
		return repository.findOne(id); //prueba
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

	@Override
	public PlayerDTO buildDTO(Player entity, Boolean herencia) {
		PlayerDTO playerDTO = new PlayerDTO();
		playerDTO.setPlayer_id(entity.getId());
		playerDTO.setPlayer_firts_name(entity.getFirstName());
		if(herencia){
			playerDTO.setTeams(teamLogical.listEntitiesToListDTOs(entity.getTeams(), !herencia));
		}
		return playerDTO;
	}

}
