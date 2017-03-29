package co.com.meerkats.ucosports.logical;

import java.util.List;

import co.com.meerkats.ucosports.domain.Player;

public interface IPlayerLogical {

	Player findPlayerById(Integer id);
	List<Player> findAll();
	Player addPlayer(Player player);
	List<Player> prueba() throws Exception;
	
}
