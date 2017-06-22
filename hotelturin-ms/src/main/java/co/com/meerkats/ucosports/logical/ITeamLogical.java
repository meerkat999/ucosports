package co.com.meerkats.ucosports.logical;

import java.util.List;

import co.com.meerkats.ucosports.domain.Team;
import co.com.meerkats.ucosports.dto.TeamDTO;

public interface ITeamLogical extends LogicalCommon<Team, TeamDTO> {

	List<Team> findAll();
	List<TeamDTO> findAllDTO();

}
