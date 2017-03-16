package co.com.meerkats.ucosports.team.rest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.team.logical.TeamLogical;

@RunWith(MockitoJUnitRunner.class)
public class TeamServiceRestTest {

	@InjectMocks
	private TeamServiceRest serviceRest;
	
	@Mock
	private TeamLogical logical;

	@Test
	public void getAll(){
		serviceRest.getAll();
		Mockito.verify(logical).findAll();
	}
	
	
}
