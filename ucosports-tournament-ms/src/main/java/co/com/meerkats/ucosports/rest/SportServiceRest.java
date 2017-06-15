package co.com.meerkats.ucosports.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.dto.SportDTO;
import co.com.meerkats.ucosports.logical.ISportLogical;

@Path("/sportService")
public class SportServiceRest {
	
	@Inject
	private ISportLogical logical;
	
	@Path("/save")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public SportDTO save(SportDTO dto) {
		return logical.buildDTO(logical.saveDTO(dto), true);
	}

	@Path("/getAll")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<SportDTO> getAll() {
		return logical.findAllDTO();
	}



	@Path("/update")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Sport update(SportDTO dto) {
		return logical.updateDTO(dto);
	}

}
