package co.com.meerkats.hotelturin.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

<<<<<<< Updated upstream
import co.com.meerkats.hotelturin.dto.EstadoDTO;
=======
import co.com.meerkats.hotelturin.dto.ClienteDTO;
>>>>>>> Stashed changes
import co.com.meerkats.hotelturin.dto.HabitacionDTO;
import co.com.meerkats.hotelturin.logical.IHabitacionLogical;

@Path("/habitacionService")
public class HabitacionServiceRest {



	@Inject
	private IHabitacionLogical logical;
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<HabitacionDTO> getAll(){
		return logical.getAll();
	}

	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public HabitacionDTO add(HabitacionDTO habitacion) throws Exception{
		return logical.add(habitacion);
		
	}	
	@POST
	@Path("/getByState")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public HabitacionDTO getbyState (EstadoDTO estado){
			return logical.getbyEstate(estado);
	}
	
	
	
	
	
}


