package co.com.meerkats.hotelturin.rest.filter;

import java.io.IOException;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.Provider;

import org.apache.log4j.Logger;
@Provider
public class CORSFilter implements ContainerResponseFilter {
	
	private final static Logger LOGGER = Logger.getLogger(CORSFilter.class);
	
	@Override
	public void filter(ContainerRequestContext request, ContainerResponseContext response) throws IOException {
		log(request, response);
		response.getHeaders().add("Access-Control-Allow-Origin", "*");
	    response.getHeaders().add("Access-Control-Allow-Headers", "Origin, Content-Type, Accept");
	    response.getHeaders().add("Access-Control-Allow-Credentials", "true");
	    response.getHeaders().add("Access-Control-Allow-Methods", "*");
	    response.getHeaders().add("Access-Control-Max-Age", "1209600");
	    if(response.getStatus() == 204){
	    	response.setStatus(200);
	    }
	}

	private void log(ContainerRequestContext request, ContainerResponseContext response) {
		String mensaje = request.getUriInfo().getAbsolutePath() + ": " + request.getMethod();
		if(response.getStatus() != Response.Status.OK.getStatusCode()){
			LOGGER.error(mensaje + " - " + response.getStatusInfo().getReasonPhrase());
		} else{
			LOGGER.info(mensaje);
		}
	}

}
