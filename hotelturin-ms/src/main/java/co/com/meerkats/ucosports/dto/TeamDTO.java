package co.com.meerkats.ucosports.dto;

import java.util.Date;
import java.util.List;

public class TeamDTO {

	private Integer team_id;
	private String team_name;
	private Integer sport_id;
	private SportDTO sport;
	private List<PlayerDTO> players;
	private Date dateCreation;
	
	public Integer getTeam_id() {
		return team_id;
	}
	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public Integer getSport_id() {
		return sport_id;
	}
	public void setSport_id(Integer sport_id) {
		this.sport_id = sport_id;
	}
	public SportDTO getSport() {
		return sport;
	}
	public void setSport(SportDTO sport) {
		this.sport = sport;
	}
	public List<PlayerDTO> getPlayers() {
		return players;
	}
	public void setPlayers(List<PlayerDTO> players) {
		this.players = players;
	}
	public Date getDateCreation() {
		return dateCreation;
	}
	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}
	
	
	
}
