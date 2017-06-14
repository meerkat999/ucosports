package co.com.meerkats.ucosports.logical.Impl;

import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.constants.StatesEnum;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.logical.IPlayerStatisticService;
import co.com.meerkats.ucosports.logical.ISportLogical;
import co.com.meerkats.ucosports.logical.ISportStatisticService;
import co.com.meerkats.ucosports.repository.ISportRepository;

@RequestScoped
public class SportLogicalImpl implements ISportLogical {

	@Inject
	private ISportRepository repository;
	
	@Inject
	private ISportStatisticService sportStatisticService;
	
	@Inject
	private IPlayerStatisticService playerStatisticService;
	
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
	public List<Sport> getAll() {
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

}
