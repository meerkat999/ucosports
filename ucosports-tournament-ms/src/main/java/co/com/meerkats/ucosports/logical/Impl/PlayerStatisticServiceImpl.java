package co.com.meerkats.ucosports.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.PlayerStatistic;
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

}
