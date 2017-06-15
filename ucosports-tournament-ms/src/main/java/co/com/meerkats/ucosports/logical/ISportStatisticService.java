package co.com.meerkats.ucosports.logical;

import java.util.List;
import java.util.Set;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.SportStatistic;
import co.com.meerkats.ucosports.dto.SportStatisticDTO;

public interface ISportStatisticService {

	SportStatistic save(SportStatistic statistic);

	SportStatistic getById(Integer id);

	Set<SportStatistic> persistSportStatisticsDTO(List<SportStatisticDTO> sportStatistics, Sport sport);

	Set<SportStatistic> updateSportStatisticsDTO(List<SportStatisticDTO> sportStatistics, Sport sport);
	
}
