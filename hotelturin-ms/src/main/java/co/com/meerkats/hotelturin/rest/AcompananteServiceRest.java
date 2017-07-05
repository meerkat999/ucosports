package co.com.meerkats.hotelturin.rest;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.dto.AcompananteDTO;
import co.com.meerkats.hotelturin.logical.IAcompananteLogical;

@Path("/acompananteService")
public class AcompananteServiceRest {

	@Inject
	private IAcompananteLogical logical;
	
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public AcompananteDTO add(AcompananteDTO acompananteDTO) throws Exception{
		return logical.add(acompananteDTO);
	}
	
}
