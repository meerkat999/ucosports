package co.com.meerkats.hotelturin.rest;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;

@Path("/consumoporservicioService")
public class ClienteConsumoRest {
	
	@Inject
	private IClienteConsumoLogical logical;
	
	@POST
	@Path("/addorupdate")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ClienteConsumoDTO add(ClienteConsumoDTO consumo) throws Exception{
		return logical.addorupdate(consumo);
	}

}
