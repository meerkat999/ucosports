package co.com.meerkats.ucosports.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.SportStatistic;
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

}
