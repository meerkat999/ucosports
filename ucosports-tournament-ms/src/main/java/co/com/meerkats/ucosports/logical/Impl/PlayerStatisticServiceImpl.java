package co.com.meerkats.ucosports.logical.Impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.PlayerStatistic;
import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.PlayerStatisticDTO;
import co.com.meerkats.ucosports.logical.IPlayerStatisticService;
import co.com.meerkats.ucosports.repository.IPlayerStatisticRepository;

@RequestScoped
public class PlayerStatisticServiceImpl implements IPlayerStatisticService {

	@Inject
	private IPlayerStatisticRepository repository;
	
	@Override
	public PlayerStatistic save(PlayerStatistic playerStatistic) {
		return repository.save(playerStatistic);
	}

	@Override
	public PlayerStatistic getById(Integer id) {
		return repository.findOne(id);
	}

	@Override
	public Set<PlayerStatistic> persistPlayerStatistics(List<PlayerStatisticDTO> playerStatistics, Sport sport) {
		Set<PlayerStatistic> listEntities = new HashSet<>();
		if(playerStatistics != null && !playerStatistics.isEmpty()){
			playerStatistics.forEach(s -> {
				PlayerStatistic statistic = new PlayerStatistic();
				statistic.setName(s.getName());
				statistic.setSport(sport);
				statistic = save(statistic);
				listEntities.add(statistic);
			});
		};
		return listEntities;
	}

	@Override
	public Set<PlayerStatistic> updatePlayerStatisticsDTO(List<PlayerStatisticDTO> playerStatistics, Sport sport) {
		Set<PlayerStatistic> listEntities = new HashSet<>();
		if(playerStatistics != null && !playerStatistics.isEmpty()){
			playerStatistics.forEach(s -> {
				PlayerStatistic statistic = new PlayerStatistic();
				if(s.getId() != null){
					statistic = getById(s.getId());
				}
				statistic.setName(s.getName());
				statistic.setSport(sport);
				statistic = save(statistic);
				listEntities.add(statistic);
			});
		};
		return listEntities;
	}

}
