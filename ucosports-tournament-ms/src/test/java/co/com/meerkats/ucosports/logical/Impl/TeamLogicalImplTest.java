package co.com.meerkats.ucosports.logical;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.domain.Team;
import co.com.meerkats.ucosports.logical.TeamLogical;
import co.com.meerkats.ucosports.repository.ITeamRepository;

@RunWith(MockitoJUnitRunner.class)
public class TeamLogicalTest {

	@InjectMocks
	private TeamLogical logical;
	
	@Mock
	private ITeamRepository repository;
	
	private List<Team> listaEsperada;
	
	@Before
	public void init(){
		listaEsperada = new ArrayList<>();
		listaEsperada.add(new Team());
		Mockito.when(repository.findAll()).thenReturn(listaEsperada);
	}
	
	@Test
	public void findAll(){
		List<Team> listaActual = logical.findAll();
		Assert.assertNotNull(listaActual);
		Assert.assertFalse(listaActual.isEmpty());
		Assert.assertEquals(listaActual, listaEsperada);
	}
}
