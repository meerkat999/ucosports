package co.com.meerkats.hotelturin.logical.Impl.test;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteKey;
import co.com.meerkats.hotelturin.logical.Impl.ClienteLogicalImpl;
import co.com.meerkats.hotelturin.repository.IClienteRepository;

@RunWith(MockitoJUnitRunner.class)
public class ClienteLogicalImplTest {

	@InjectMocks
	private ClienteLogicalImpl logical;
	
	@Mock
	private IClienteRepository repository;
	
	@Before
	public void init(){
		List<Cliente> lista = new ArrayList<>();
		Cliente cliente = new Cliente();
		ClienteKey id = new ClienteKey();
		id.setId("123");
		id.setTipoDocumento(1);
		cliente.setId(id);
		cliente.setNombreUno("Crisman");
		cliente.setNombreDos("Alejandro");
		cliente.setApellidoUno("Eusse");
		cliente.setApellidoDos("Valencia");
		cliente.setNombreCompleto("Crisman Alejandro Eusse Valencia");
		cliente.setCelular(3116963745L);
		cliente.setCorreo("cris@car.com");
		cliente.setFechaNacimiento(new Date());
		cliente.setFechaRegistro(new Date());
		lista.add(cliente);
		Mockito.when(repository.findAll()).thenReturn(lista);
	}
	
	@Test
	public void debeGenerarElArchivoConTodos(){
		File file = logical.exportAll();
		Assert.assertNotNull(file);
	}
	
}
