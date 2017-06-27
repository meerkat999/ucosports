package co.com.meerkats.hotelturin.rest;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.logical.IArriendoLogical;

@Path("/arriendoService")
public class ArriendoServiceRest {
	
	@Inject
	private IArriendoLogical logical;

	@POST
	@Path("/getById")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArriendoDTO getById(ArriendoDTO arriendoDTO){
		return logical.getById(arriendoDTO);
	}
	
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArriendoDTO add(ArriendoDTO arriendoDTO) throws Exception{
		return logical.add(arriendoDTO);
	}
	
}
