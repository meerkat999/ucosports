package co.com.meerkats.ucosports.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.dto.TeamDTO;
import co.com.meerkats.ucosports.logical.ITeamLogical;

@Path("/teamService")
public class TeamServiceRest {

	@Inject
	private ITeamLogical logical;
	
	@Path("/getAll")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TeamDTO> getAll() {
		List<TeamDTO> listaDTOS = logical.findAllDTO();
		return listaDTOS;
	}
	
}
