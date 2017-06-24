package co.com.meerkats.hotelturin.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.dto.TipoDocumentoDTO;
import co.com.meerkats.hotelturin.logical.ITipoDocumentoLogical;

@Path("/tipoDocumentoService")
public class TipoDocumentoServiceRest {

	@Inject
	private ITipoDocumentoLogical logical;
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TipoDocumentoDTO> getAll(){
		return logical.getAll();
	}
	
}
