package co.com.meerkats.ucosports.player.logical;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.domain.Player;
import co.com.meerkats.ucosports.player.repository.IPlayerRepository;

@RunWith(MockitoJUnitRunner.class)
public class PlayerLogicalTest {

	private static final String NOMBRE = "Crisman";

	@InjectMocks
	private PlayerLogical logical;
	
	@Mock
	private IPlayerRepository repository;
	
	private Integer ID = 1;
	private Integer IDNULL = 2;
	
	@Before
	public void init(){
		Player player = new Player();
		player.setFirstName(NOMBRE);
		Mockito.when(repository.findOne(ID)).thenReturn(player);
	}
	
	@Test
	public void getPlayer(){
		Player player = logical.findPlayerById(ID);
		Assert.assertNotNull(player);
		Assert.assertEquals(player.getFirstName(), NOMBRE);
	}
	
	@Test
	public void getPlayerNull(){
		Player player = logical.findPlayerById(IDNULL);
		Assert.assertNull(player);
	}
	
}
