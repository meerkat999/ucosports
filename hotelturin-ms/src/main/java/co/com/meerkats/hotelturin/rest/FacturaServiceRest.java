package co.com.meerkats.hotelturin.rest;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.hotelturin.dto.FacturaDTO;
import co.com.meerkats.hotelturin.logical.IFacturaLogical;

@Path("/facturaService")
public class FacturaServiceRest {

	@Inject
	private IFacturaLogical logical;
	
	@POST
	@Path("/facturarconsumoclientesincheckin")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public FacturaDTO facturarConsumoClienteSinCheckin(FacturaDTO facturaDTO) throws Exception{
		return logical.facturarConsumoClienteSinCheckin(facturaDTO);
	}
	
	@POST
	@Path("/facturarHospedaje")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public FacturaDTO facturarHospedaje(FacturaDTO facturaDTO) throws Exception{
		return logical.facturarHospejade(facturaDTO);
	}
	
	@POST
	@Path("/facturarHospedajeAndCheckout")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public FacturaDTO facturarHospedajeAndCheckout(FacturaDTO facturaDTO) throws Exception{
		return logical.facturarHospedajeAndCheckout(facturaDTO);
	}
	
	@POST
	@Path("/getByArriendoAndClienteAndState")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public FacturaDTO getByArriendoAndClienteAndState(FacturaDTO facturaDTO) throws Exception{
		return logical.getByArriendoIdAndClienteIdAndTipoDocumentoIDandEstadoId(facturaDTO);
	}


}
