package co.com.meerkats.ucosports.rest;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import co.com.meerkats.ucosports.domain.PlayerStatistic;
import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.SportStatistic;
import co.com.meerkats.ucosports.domain.dto.PlayerStatisticDTO;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.domain.dto.SportStatisticDTO;
import co.com.meerkats.ucosports.logical.ISportLogical;

@Path("/sportService")
public class SportServiceRest {
	
	@Inject
	private ISportLogical logical;
	
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
		Set<SportStatistic> listSportStatistic = s.getListSportStatistic();
		List<SportStatisticDTO> listaSportStatisticDTO = new ArrayList<>();
		if(listSportStatistic != null && !listSportStatistic.isEmpty()){
			listSportStatistic.forEach(ss -> {
				SportStatisticDTO sportStaticDTO = new SportStatisticDTO();
				sportStaticDTO.setName(ss.getName());
				sportStaticDTO.setId(ss.getId());
				sportStaticDTO.setSport_id(s.getId());
				listaSportStatisticDTO.add(sportStaticDTO);
			});
		}
		dto.setSportStatistics(listaSportStatisticDTO);
		Set<PlayerStatistic> listPlayerStatistic = s.getListPlayerStatistic();
		List<PlayerStatisticDTO> listPlayerStatisticDTO = new ArrayList<>();
		if(listPlayerStatistic != null && !listPlayerStatistic.isEmpty()){
			listPlayerStatistic.forEach(ps -> {
				PlayerStatisticDTO playerStatisticDTO = new PlayerStatisticDTO();
				playerStatisticDTO.setName(ps.getName());
				playerStatisticDTO.setId(ps.getId());
				playerStatisticDTO.setSport_id(s.getId());
				listPlayerStatisticDTO.add(playerStatisticDTO);
			});
		}
		dto.setPlayerStatistics(listPlayerStatisticDTO);
		return dto;
	}

	@Path("/update")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Sport update(SportDTO dto) {
		return logical.updateDTO(dto);
	}

}
