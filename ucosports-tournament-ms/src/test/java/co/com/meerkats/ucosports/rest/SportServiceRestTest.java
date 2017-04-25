package co.com.meerkats.ucosports.rest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.logical.ISportLogical;

@RunWith(MockitoJUnitRunner.class)
public class SportServiceRestTest {

	@InjectMocks
	private SportServiceRest rest;
	
	@Mock
	private ISportLogical logical;
	
	@Test
	public void verificarAccesoAlEjb(){
		SportDTO dto = new SportDTO();
		Sport sport = new Sport();
		Mockito.when(logical.saveDTO(dto)).thenReturn(sport);
		rest.save(dto);
		Mockito.verify(logical).saveDTO(dto);
	}
	
}
