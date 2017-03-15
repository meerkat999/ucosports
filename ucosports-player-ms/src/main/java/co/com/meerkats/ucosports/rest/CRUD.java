package co.com.meerkats.ucosports.rest;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.dto.PlayerDTO;
import co.com.meerkats.ucosports.player.repository.IPlayerRepository;

@Path("/crud")
public class CRUD {

	@Inject
	private IPlayerRepository repository;
	
	@Path("/getPlayer/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public PlayerDTO getPlayer(@PathParam("id") Integer id) {
		Player player = repository.findOne(id);
		PlayerDTO playerDto = new PlayerDTO();
		playerDto.firtsName = player.getFirstName();
		return playerDto;
	}
}