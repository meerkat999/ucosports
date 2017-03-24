package co.com.meerkats.ucosports.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.Team;
import co.com.meerkats.ucosports.logical.ITeamLogical;
import co.com.meerkats.ucosports.repository.ITeamRepository;

@RequestScoped
public class TeamLogicalImpl implements ITeamLogical {

	@Inject
	private ITeamRepository repository;
	
	@Override
	public List<Team> findAll() {
		return repository.findAll();
	}

}
