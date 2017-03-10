package co.com.meerkats.ucosports.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.dto.PlayerDTO;

@Path("/crud")
public class CRUD {

	@Path("/getPlayer")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public PlayerDTO getPlayer() {
		Player player = new Player();
		player.setFirstName("Crisman");
		PlayerDTO playerDto = new PlayerDTO();
		playerDto.firtsName = player.getFirstName();
		return playerDto;
	}
}