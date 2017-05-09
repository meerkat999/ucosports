package co.com.meerkats.ucosports.logical.Impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.SportStatistic;
import co.com.meerkats.ucosports.domain.dto.SportStatisticDTO;
import co.com.meerkats.ucosports.logical.ISportStatisticService;
import co.com.meerkats.ucosports.repository.ISportStatisticRepository;

@RequestScoped
public class SportStatisticServiceImpl implements ISportStatisticService {

	@Inject
	private ISportStatisticRepository repository;
	
	@Override
	public SportStatistic save(SportStatistic statistic) {
		return repository.save(statistic);
	}

	@Override
	public SportStatistic getById(Integer id) {
		return repository.findOne(id);
	}

	@Override
	public Set<SportStatistic> persistSportStatisticsDTO(List<SportStatisticDTO> sportStatistics, Sport sport) {
		Set<SportStatistic> listEntities = new HashSet<>();
		if(sportStatistics != null && !sportStatistics.isEmpty()){
			sportStatistics.forEach(s -> {
				SportStatistic statistic = new SportStatistic();
				statistic.setName(s.getName());
				statistic.setSport(sport);
				statistic = save(statistic);
				listEntities.add(statistic);
			});
		};
		return listEntities;
	}

	@Override
	public Set<SportStatistic> updateSportStatisticsDTO(List<SportStatisticDTO> sportStatistics, Sport sport) {
		Set<SportStatistic> listEntities = new HashSet<>();
		if(sportStatistics != null && !sportStatistics.isEmpty()){
			sportStatistics.forEach(s -> {
				SportStatistic statistic = new SportStatistic();
				if(s.getId() != null){
					statistic = getById(s.getId());
				}
				statistic.setName(s.getName());
				statistic.setSport(sport);
				statistic = save(statistic);
				listEntities.add(statistic);
			});
		}
		return listEntities;
	}

}
