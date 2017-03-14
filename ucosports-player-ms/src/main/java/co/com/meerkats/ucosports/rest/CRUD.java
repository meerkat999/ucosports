package co.com.meerkats.ucosports.rest;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.dto.PlayerDTO;
import co.com.meerkats.ucosports.player.repository.IPlayerRepository;

@Path("/crud")
public class CRUD {

	@Inject
	private IPlayerRepository repository;
	
	@Path("/getPlayer")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public PlayerDTO getPlayer() {
		Player player = new Player();
		player.setFirstName("Crisman");
		PlayerDTO playerDto = new PlayerDTO();
		playerDto.firtsName = player.getFirstName();
		System.out.println("prueba");
		Player player2 = repository.findOne(0);
		System.out.println(player2);
		return playerDto;
	}
}