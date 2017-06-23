package co.com.meerkats.hotelturin.rest;

import javax.inject.Inject;
import javax.ws.rs.Path;

import co.com.meerkats.hotelturin.logical.IClienteLogical;

@Path("/playerService")
public class ClienteServiceRest {

	@Inject
	private IClienteLogical logical;
	
}