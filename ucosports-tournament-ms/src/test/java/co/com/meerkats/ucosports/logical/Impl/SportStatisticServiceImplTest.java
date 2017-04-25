package co.com.meerkats.ucosports.logical.Impl;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.ucosports.domain.SportStatistic;
import co.com.meerkats.ucosports.repository.ISportStatisticRepository;

@RunWith(MockitoJUnitRunner.class)
public class SportStatisticServiceImplTest {

	@InjectMocks
	private SportStatisticServiceImpl service;
	
	@Mock
	private ISportStatisticRepository repository;
	
	@Test
	public void debeGuardarUnaEstadistica(){
		SportStatistic estadisticaAGuardar = new SportStatistic();
		Mockito.when(repository.save(estadisticaAGuardar)).thenReturn(estadisticaAGuardar);
		SportStatistic estadisticaObtenida = service.save(estadisticaAGuardar);
		Assert.assertNotNull(estadisticaObtenida);
		Assert.assertEquals(estadisticaAGuardar, estadisticaObtenida);
	}
	
}
