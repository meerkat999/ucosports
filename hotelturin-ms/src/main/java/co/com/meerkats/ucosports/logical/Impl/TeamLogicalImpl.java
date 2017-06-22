package co.com.meerkats.ucosports.logical.Impl;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.ucosports.domain.Team;
import co.com.meerkats.ucosports.dto.TeamDTO;
import co.com.meerkats.ucosports.logical.IPlayerLogical;
import co.com.meerkats.ucosports.logical.ISportLogical;
import co.com.meerkats.ucosports.logical.ITeamLogical;
import co.com.meerkats.ucosports.repository.ITeamRepository;

@RequestScoped
public class TeamLogicalImpl extends LogicalCommonImpl<Team, TeamDTO> implements ITeamLogical {

	@Inject
	private ITeamRepository repository;
	
	@Inject
	private ISportLogical sportLogical;
	
	@Inject
	private IPlayerLogical playerLogical;
	
	@Override
	public List<Team> findAll() {
		return repository.findAll();
	}

	@Override
	public List<TeamDTO> findAllDTO() {
		List<Team> findAll = findAll();
		return listEntitiesToListDTOs(findAll, true);
	}

	@Override
	public TeamDTO buildDTO(Team team, Boolean herencia) {
		TeamDTO teamDTO = new TeamDTO();
		teamDTO.setTeam_id(team.getId().getId());
		teamDTO.setTeam_name(team.getTeamName());
		teamDTO.setSport_id(team.getId().getSport_id());
		if(herencia){
			teamDTO.setSport(sportLogical.buildDTO(team.getSport(), false));
			teamDTO.setPlayers(playerLogical.listEntitiesToListDTOs(team.getPlayers(), false));
		}
		teamDTO.setDateCreation(team.getDateCreation());
		return teamDTO;
	}
	
	

}
