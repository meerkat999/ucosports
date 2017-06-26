package co.com.meerkats.hotelturin.rest;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.utils.DateDTO;
import co.com.meerkats.hotelturin.dto.utils.ListDateDTO;
import co.com.meerkats.hotelturin.logical.IClienteLogical;

@Path("/clienteService")
public class ClienteServiceRest {

	@Inject
	private IClienteLogical logical;
	
	@GET
	@Path("/exportAll")
	@Produces("application/vnd.ms-excel")
	public Response exportAll(){
		File file = logical.exportAll();
	    ResponseBuilder response = Response.ok((Object) file);
	    response.header("Content-Disposition", "attachment; filename=reporteClientes.xlsx");
	    return response.build();
	}
	
	@GET
	@Path("/getYearsWithClients")
	@Produces(MediaType.APPLICATION_JSON)
	public List<DateDTO> getYearsWithClients(){
		return logical.getYearsWithClients();
	}
	
	@POST
	@Path("/getMonthsWithClients")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ListDateDTO getMonthsWithClients(DateDTO dto){
		return logical.getMonthsWithClients(dto);
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
