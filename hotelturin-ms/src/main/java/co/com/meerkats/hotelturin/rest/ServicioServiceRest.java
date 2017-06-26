package co.com.meerkats.hotelturin.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.ListServicioDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;
import co.com.meerkats.hotelturin.logical.IServicioLogical;

@Path("/servicioService")
public class ServicioServiceRest {

	@Inject
	private IServicioLogical logical;
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ServicioDTO> getAll(){
		return logical.getAll();
	}

	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ServicioDTO add(ServicioDTO servicio) throws Exception{
		return logical.add(servicio);
		
	}	
	@POST
	@Path("/getByState")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ListServicioDTO getByState (EstadoDTO estado){
		return logical.getByState(estado);
	}
	
	@POST
	@Path("/getById")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ServicioDTO getById(ServicioDTO serviciodto){
		return logical.getById(serviciodto);
	}
	
}


