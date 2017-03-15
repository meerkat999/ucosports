package co.com.meerkats.ucosports.player.rest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.domain.dto.PlayerDTO;
import co.com.meerkats.ucosports.player.logical.PlayerLogical;

@RunWith(MockitoJUnitRunner.class)
public class PlayerServiceRestTest {
	
	private static final int ID = 0;

	@InjectMocks
	private PlayerServiceRest service;
	
	@Mock
	private PlayerLogical logical;
	
	@Test
	public void verifyFindPlayer(){
		PlayerDTO playerDto = new PlayerDTO();
		playerDto.id = ID;
		service.getPlayerById(playerDto);
		Mockito.verify(logical).findPlayerById(ID);
	}
	
}
