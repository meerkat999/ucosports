package co.com.meerkats.ucosports.rest.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class CORSFilter implements Filter {
	
	private final static Logger LOGGER = Logger.getLogger(CORSFilter.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		LOGGER.info("INIT");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse responses = (HttpServletResponse) response;
		HttpServletRequest requests = (HttpServletRequest) request;
		LOGGER.info(requests.getRequestURI());
		responses.setHeader("Access-Control-Allow-Origin", "*");
		responses.setHeader("Access-Control-Allow-Headers", "Origin, Content-Type, Accept");
		responses.setHeader("Access-Control-Allow-Credentials", "true");
		responses.setHeader("Access-Control-Allow-Methods", "*");
		responses.setHeader("Access-Control-Max-Age", "1209600");
		chain.doFilter(requests, responses);
	}

	@Override	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	

}
