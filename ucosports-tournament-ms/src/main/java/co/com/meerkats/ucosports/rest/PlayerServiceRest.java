package co.com.meerkats.ucosports.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.domain.dto.PlayerDTO;
import co.com.meerkats.ucosports.logical.IPlayerLogical;

@Path("/playerService")
public class PlayerServiceRest {

	@Inject
	private IPlayerLogical logical;
	
	@Path("/getById")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Player getPlayerById(PlayerDTO playerDto) {
		Player player = null;
		if(playerDto != null && playerDto.id != null){
			player = logical.findPlayerById(playerDto.id);
		}
		return player;
	}

	@Path("/getAll")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Player> getAllPlayers() {
		return logical.findAll();
	}
	
	@Path("/prueba")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Player> prueba() throws Exception{
		return logical.prueba();
	}
}