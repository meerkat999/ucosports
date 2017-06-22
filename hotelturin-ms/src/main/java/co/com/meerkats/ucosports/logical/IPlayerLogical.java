package co.com.meerkats.ucosports.logical;

import java.util.List;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.dto.PlayerDTO;

public interface IPlayerLogical extends LogicalCommon<Player, PlayerDTO> {

	Player findPlayerById(Integer id);
	List<Player> findAll();
	Player addPlayer(Player player);
	List<Player> prueba() throws Exception;
	
}
