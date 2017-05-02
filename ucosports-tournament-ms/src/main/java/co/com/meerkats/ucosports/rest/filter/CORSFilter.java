package co.com.meerkats.ucosports.rest.filter;

import java.io.IOException;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.ext.Provider;

import org.apache.log4j.Logger;
@Provider
public class CORSFilter implements ContainerResponseFilter {
	
	private final static Logger LOGGER = Logger.getLogger(CORSFilter.class);
	
	@Override
	public void filter(ContainerRequestContext paramContainerRequestContext, ContainerResponseContext paramContainerResponseContext) throws IOException {
		LOGGER.info(paramContainerRequestContext.getUriInfo().getAbsolutePath());
		paramContainerResponseContext.getHeaders().add("Access-Control-Allow-Origin", "*");
	    paramContainerResponseContext.getHeaders().add("Access-Control-Allow-Headers", "Origin, Content-Type, Accept");
	    paramContainerResponseContext.getHeaders().add("Access-Control-Allow-Credentials", "true");
	    paramContainerResponseContext.getHeaders().add("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");
	    paramContainerResponseContext.getHeaders().add("Access-Control-Max-Age", "1209600");
	}

}
