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
	@Path("/update")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ServicioDTO update(ServicioDTO servicio) throws Exception{
		return logical.update(servicio);
	}
	
	@POST
	@Path("/desactivar")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ServicioDTO desactivar(ServicioDTO servicio) throws Exception{
		return logical.desactivar(servicio);
	}	
	

	@POST
	@Path("/activar")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ServicioDTO activar(ServicioDTO servicio) throws Exception{
		return logical.activar(servicio);
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
	
	@GET
	@Path("/exportAllCount")
	@Produces("application/vnd.ms-excel")
	public Response exportAll(){
		File file = logical.exportAllCount();
	    ResponseBuilder response = Response.ok((Object) file);
	    response.header("Content-Disposition", "attachment; filename=reporteServicios.xlsx");
	    return response.build();
	}
	
}


