package co.com.meerkats.ucosports.rest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.logical.Impl.TeamLogicalImpl;

@RunWith(MockitoJUnitRunner.class)
public class TeamServiceRestTest {

	@InjectMocks
	private TeamServiceRest serviceRest;
	
	@Mock
	private TeamLogicalImpl logical;

	@Test
	public void getAll(){
		serviceRest.getAll();
		Mockito.verify(logical).findAllDTO();
	}
	
	
}
