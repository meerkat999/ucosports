package co.com.meerkats.hotelturin.rest;

import java.io.File;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.ListArriendoDTO;
import co.com.meerkats.hotelturin.logical.IArriendoLogical;

@Path("/arriendoService")
public class ArriendoServiceRest {
	
	@Inject
	private IArriendoLogical logical;

	@GET
	@Path("/exportAll")
	@Produces("application/vnd.ms-excel")
	public Response exportAll(){
		File file = logical.exportAll();
	    ResponseBuilder response = Response.ok((Object) file);
	    response.header("Content-Disposition", "attachment; filename=reporteHospedajes.xlsx");
	    return response.build();
	}
	
	@POST
	@Path("/getByClienteKeyCheckInActive")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArriendoDTO getByClienteKeyCheckInActive(ClienteKeyDTO clienteKeyDTO) throws Exception{
		return logical.getByClienteKeyCheckInActive(clienteKeyDTO);
	}
	
	@POST
	@Path("/getById")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArriendoDTO getById(ArriendoDTO arriendoDTO){
		return logical.getById(arriendoDTO);
	}
	
	@POST
	@Path("/getByState")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ListArriendoDTO getByState(ArriendoDTO arriendoDTO){
		return logical.getByState(arriendoDTO);
	}
	
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArriendoDTO add(ArriendoDTO arriendoDTO) throws Exception{
		return logical.add(arriendoDTO);
	}
	
	@POST
	@Path("/checkOut")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArriendoDTO checkOut(ArriendoDTO arriendoDTO) throws Exception{
		return logical.checkOut(arriendoDTO);
	}
	
}
