package co.com.meerkats.ucosports.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.SportDTO;
import co.com.meerkats.ucosports.logical.ISportLogical;
import co.com.meerkats.ucosports.repository.ISportRepository;

@RequestScoped
public class SportLogicalImpl implements ISportLogical {

	@Inject
	private ISportRepository repository;
	
	@Override
	public Sport save(Sport sport) {
		return repository.save(sport);
	}

	@Override
	public Sport saveDTO(SportDTO sportDTO) {
		Sport sport = new Sport();
		sport.setName(sportDTO.getName());
		sport.setNumberPlayers(sportDTO.getNumberPlayers());
		sport.setNumberTimes(sportDTO.getNumberTimes());
		sport.setTimeTimes(sportDTO.getTimeTimes());
		return save(sport);
	}

}
