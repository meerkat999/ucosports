package co.com.meerkats.ucosports.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.SportStatistic;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.logical.ISportLogical;
import co.com.meerkats.ucosports.logical.ISportStatisticService;
import co.com.meerkats.ucosports.repository.ISportRepository;

@RequestScoped
public class SportLogicalImpl implements ISportLogical {

	@Inject
	private ISportRepository repository;
	
	@Inject
	private ISportStatisticService statisticService;
	
	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public Sport save(Sport sport) {
		return repository.save(sport);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public Sport saveDTO(SportDTO sportDTO) {
		Sport sport = new Sport();
		sport.setName(sportDTO.getName());
		sport.setNumberPlayers(sportDTO.getNumberPlayers());
		sport.setNumberTimes(sportDTO.getNumberTimes());
		sport.setTimeTimes(sportDTO.getTimeTimes());
		sport = save(sport);
		persistStatistics(sportDTO, sport);
		return sport;
	}

	private void persistStatistics(SportDTO sportDTO, Sport sport) {
		sportDTO.getStatistics().forEach(s -> {
			SportStatistic statistic = new SportStatistic();
			statistic.setName(s);
			statistic.setSport(sport);
			statisticService.save(statistic);
		});
	}

	@Override
	public List<Sport> getAll() {
		return repository.findAll();
	}

}