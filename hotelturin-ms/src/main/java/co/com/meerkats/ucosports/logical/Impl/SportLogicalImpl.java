package co.com.meerkats.ucosports.logical.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.ucosports.domain.PlayerStatistic;
import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.SportStatistic;
import co.com.meerkats.ucosports.domain.constants.StatesEnum;
import co.com.meerkats.ucosports.dto.PlayerStatisticDTO;
import co.com.meerkats.ucosports.dto.SportDTO;
import co.com.meerkats.ucosports.dto.SportStatisticDTO;
import co.com.meerkats.ucosports.logical.IPlayerStatisticService;
import co.com.meerkats.ucosports.logical.ISportLogical;
import co.com.meerkats.ucosports.logical.ISportStatisticService;
import co.com.meerkats.ucosports.logical.ITeamLogical;
import co.com.meerkats.ucosports.repository.ISportRepository;

@RequestScoped
public class SportLogicalImpl extends LogicalCommonImpl<Sport, SportDTO> implements ISportLogical {

	@Inject
	private ISportRepository repository;
	
	@Inject
	private ISportStatisticService sportStatisticService;
	
	@Inject
	private IPlayerStatisticService playerStatisticService;
	
	@Inject
	private ITeamLogical teamLogical;
	
	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public Sport save(Sport sport) {
		return repository.save(sport);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public Sport saveDTO(SportDTO sportDTO) {
		Sport sport = buildEntity(sportDTO);
		sport.setDateCreation(new Date());
		sport.setState(StatesEnum.ACTIVO.getValue());
		sport = save(sport);
		sportStatisticService.persistSportStatisticsDTO(sportDTO.getSportStatistics(), sport);
		playerStatisticService.persistPlayerStatistics(sportDTO.getPlayerStatistics(), sport);
		return sport;
	}

	@Override
	public List<Sport> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public Sport updateDTO(SportDTO sportDTO) {
		Sport sport = repository.findOne(sportDTO.getId());
		setEntity(sportDTO, sport);
		sportStatisticService.updateSportStatisticsDTO(sportDTO.getSportStatistics(), sport);
		playerStatisticService.updatePlayerStatisticsDTO(sportDTO.getPlayerStatistics(), sport);
		return repository.save(sport);
	}
	
	private Sport buildEntity(SportDTO sportDTO) {
		Sport sport = new Sport();
		sport = setEntity(sportDTO, sport);
		return sport;
	}
	
	private Sport setEntity(SportDTO sportDTO, Sport sport) {
		sport.setName(sportDTO.getName());
		sport.setNumberPlayers(sportDTO.getNumberPlayers());
		sport.setNumberTimes(sportDTO.getNumberTimes());
		sport.setTimeTimes(sportDTO.getTimeTimes());
		return sport;
	}

	@Override
	public List<SportDTO> findAllDTO() {
		return listEntitiesToListDTOs(findAll(), true);
	}

	@Override
	public SportDTO buildDTO(Sport s, Boolean herencia) {
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
		if(herencia){
			dto.setTeams(teamLogical.listEntitiesToListDTOs(new ArrayList<>(s.getListTeams()), false));
		}
		return dto;
	}

}
