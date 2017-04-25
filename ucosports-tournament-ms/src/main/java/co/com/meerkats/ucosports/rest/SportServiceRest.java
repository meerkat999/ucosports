package co.com.meerkats.ucosports.rest;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.domain.dto.graphic.SportFormDTO;
import co.com.meerkats.ucosports.logical.ISportLogical;

@Path("/sportService")
public class SportServiceRest {
	
	@Inject
	private ISportLogical logical;
	
	@Path("/getForm")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public SportFormDTO getPlayerById() {
		SportFormDTO sportFormDTO = new SportFormDTO();
		return sportFormDTO;
	}

	
	@Path("/save")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public SportDTO save(SportDTO dto) {
		Sport sport = logical.saveDTO(dto);
		return buildDTO(sport);
	}

	@Path("/getAll")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<SportDTO> getAll() {
		List<Sport> lista = logical.getAll();
		List<SportDTO> listaDTO = new ArrayList<>(); 
		if(lista != null && !lista.isEmpty()){
			lista.stream().forEach(s -> {
				listaDTO.add(buildDTO(s));
			});
		}
		return listaDTO;
	}

	private SportDTO buildDTO(Sport s) {
		SportDTO dto = new SportDTO();
		dto.setId(s.getId());
		dto.setName(s.getName());
		dto.setNumberPlayers(s.getNumberPlayers());
		dto.setNumberTimes(s.getNumberTimes());
		dto.setTimeTimes(s.getTimeTimes());
		return dto;
	}

}
