package co.com.meerkats.hotelturin.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.dto.MedioPagoDTO;
import co.com.meerkats.hotelturin.logical.IMedioPagoLogical;

@Path("/medioPagoService")
public class MedioPagoServiceRest {

	@Inject
	private IMedioPagoLogical logical;
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<MedioPagoDTO> fingAll(){
		return logical.findALL();
	}
	
}
