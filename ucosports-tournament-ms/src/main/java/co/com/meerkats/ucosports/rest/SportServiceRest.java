package co.com.meerkats.ucosports.rest;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.domain.dto.graphic.SportFormDTO;
import co.com.meerkats.ucosports.logical.ISportLogical;

@Path("/sportService")
public class SportServiceRest {
	
	@Inject
	private ISportLogical logical;
	
	@Path("/getForm")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public SportFormDTO getPlayerById() {
		SportFormDTO sportFormDTO = new SportFormDTO();
		return sportFormDTO;
	}

	
	@Path("/getForm")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public SportDTO save(SportDTO dto) {
		Sport sport = logical.saveDTO(dto);
		dto.setId(sport.getId());
		return dto;
	}

}
