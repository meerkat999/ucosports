package co.com.meerkats.ucosports.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Jugador;
import co.com.meerkats.ucosports.dto.JugadorDTO;

@Path("/crud")
public class CRUD {

	@Path("/obtenerJugador")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public JugadorDTO obtenerJugador() {
		Jugador jugador = new Jugador();
		jugador.setPrimerNombre("Crisman");
		JugadorDTO jugadorDto = new JugadorDTO();
		jugadorDto.primerNombre = jugador.getPrimerNombre();
		return jugadorDto;
	}
}