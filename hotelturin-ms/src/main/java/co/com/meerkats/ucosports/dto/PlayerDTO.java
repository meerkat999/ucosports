package co.com.meerkats.ucosports.dto;

import java.util.List;

public class PlayerDTO {

	private Integer player_id;
	private String player_firts_name;
	private List<TeamDTO> teams;
	
	public String getPlayer_firts_name() {
		return player_firts_name;
	}
	public void setPlayer_firts_name(String player_firts_name) {
		this.player_firts_name = player_firts_name;
	}
	public Integer getPlayer_id() {
		return player_id;
	}
	public void setPlayer_id(Integer player_id) {
		this.player_id = player_id;
	}
	public List<TeamDTO> getTeams() {
		return teams;
	}
	public void setTeams(List<TeamDTO> teams) {
		this.teams = teams;
	}
	
	
	
}
