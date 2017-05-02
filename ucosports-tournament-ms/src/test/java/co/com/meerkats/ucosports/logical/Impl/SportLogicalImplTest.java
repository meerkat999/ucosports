package co.com.meerkats.ucosports.logical.Impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.PlayerStatisticDTO;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.domain.dto.SportStatisticDTO;
import co.com.meerkats.ucosports.logical.ISportStatisticService;
import co.com.meerkats.ucosports.repository.ISportRepository;

@RunWith(MockitoJUnitRunner.class)
public class SportLogicalImplTest {

	@InjectMocks
	private SportLogicalImpl logical;
	
	@Mock
	private ISportRepository repository;	
	
	@Mock
	private ISportStatisticService statisticService;
	
	@Test
	public void debeTraerTodosLosDeportes(){
		List<Sport> listaEsperada = new ArrayList<>();
		Mockito.when(repository.findAll()).thenReturn(listaEsperada);
		List<Sport> listaEncontrada = logical.getAll();
		Assert.assertEquals(listaEncontrada, listaEsperada);
	}
	
	@Test
	public void debeGuardarUnaEntidadDesdeUnDTO(){
		SportDTO sportDTO = new SportDTO();
		sportDTO.setName("futbol");
		List<SportStatisticDTO> sportStatistics = new ArrayList<>();
		sportDTO.setSportStatistics(sportStatistics);
		List<PlayerStatisticDTO> playerStatistics = new ArrayList<>();
		sportDTO.setPlayerStatistics(playerStatistics);
		Sport sport = new Sport();
		sport.setName(sportDTO.getName());
		Mockito.when(repository.save((Sport) Mockito.any())).thenReturn(sport);
		Sport sportObtenido = logical.saveDTO(sportDTO);
		Assert.assertNotNull(sportObtenido);
		Assert.assertEquals(sport, sportObtenido);
	}
	
}
