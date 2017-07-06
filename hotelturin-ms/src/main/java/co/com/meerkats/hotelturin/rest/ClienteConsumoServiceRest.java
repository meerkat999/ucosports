package co.com.meerkats.hotelturin.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;

@Path("/clienteConsumoService")
public class ClienteConsumoServiceRest {

	@Inject
	private IClienteConsumoLogical logical;
	
	@GET
	@Path("/findAll")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public List<ClienteConsumo> addAfterCheckin() throws Exception{ //METODO SOLO DE PRUEBA, NO DEVOLVER ENTIDADES
		return logical.findAll();
	}

}
