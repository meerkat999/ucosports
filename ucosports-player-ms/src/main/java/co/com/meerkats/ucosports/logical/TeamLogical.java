package co.com.meerkats.ucosports.team.logical;

import java.util.List;

import javax.enterprise.context.Dependent;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.Team;
import co.com.meerkats.ucosports.repository.ITeamRepository;

@Dependent
public class TeamLogical {

	@Inject
	private ITeamRepository repository;
	
	public List<Team> findAll() {
		return repository.findAll();
	}

}
