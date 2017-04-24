package co.com.meerkats.ucosports.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.dto.graphic.SportFormDTO;

@Path("/sportService")
public class SportServiceRest {
	
	@Path("/getForm")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public SportFormDTO getPlayerById() {
		SportFormDTO sportFormDTO = new SportFormDTO();
		return sportFormDTO;
	}

}
