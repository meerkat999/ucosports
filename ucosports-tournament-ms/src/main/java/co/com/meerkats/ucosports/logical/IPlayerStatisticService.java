package co.com.meerkats.ucosports.logical;

import java.util.List;
import java.util.Set;

import co.com.meerkats.ucosports.domain.PlayerStatistic;
import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.PlayerStatisticDTO;

public interface IPlayerStatisticService {

	PlayerStatistic save(PlayerStatistic playerStatistic);

	PlayerStatistic getById(Integer id);

	Set<PlayerStatistic> persistPlayerStatistics(List<PlayerStatisticDTO> playerStatistics, Sport sport);

	Set<PlayerStatistic> updatePlayerStatisticsDTO(List<PlayerStatisticDTO> playerStatistics, Sport sport);
	
}
