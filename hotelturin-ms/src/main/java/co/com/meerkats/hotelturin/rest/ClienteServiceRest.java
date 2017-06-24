package co.com.meerkats.hotelturin.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.logical.IClienteLogical;

@Path("/clienteService")
public class ClienteServiceRest {

	@Inject
	private IClienteLogical logical;
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ClienteDTO> getAll(){
		return logical.getAll();
	}

	@POST
	@Path("/getById")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ClienteDTO getById(ClienteKeyDTO key){
		return logical.getById(key);
	}
	
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ClienteDTO add(ClienteDTO cliente) throws Exception{
		return logical.add(cliente);
	}
	
}
