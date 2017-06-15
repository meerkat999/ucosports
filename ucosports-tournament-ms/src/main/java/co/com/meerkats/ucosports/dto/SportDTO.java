package co.com.meerkats.ucosports.dto;

import java.util.List;

public class SportDTO {

	private Integer id;
	private String name;
	private Integer numberPlayers;
	private Integer numberTimes;
	private Integer timeTimes;
	private List<SportStatisticDTO> sportStatistics;
	private List<PlayerStatisticDTO> playerStatistics;
	private List<TeamDTO> teams;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNumberPlayers() {
		return numberPlayers;
	}
	public void setNumberPlayers(Integer numberPlayers) {
		this.numberPlayers = numberPlayers;
	}
	public Integer getNumberTimes() {
		return numberTimes;
	}
	public void setNumberTimes(Integer numberTimes) {
		this.numberTimes = numberTimes;
	}
	public Integer getTimeTimes() {
		return timeTimes;
	}
	public void setTimeTimes(Integer timeTimes) {
		this.timeTimes = timeTimes;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<SportStatisticDTO> getSportStatistics() {
		return sportStatistics;
	}
	public void setSportStatistics(List<SportStatisticDTO> sportStatistics) {
		this.sportStatistics = sportStatistics;
	}
	public List<PlayerStatisticDTO> getPlayerStatistics() {
		return playerStatistics;
	}
	public void setPlayerStatistics(List<PlayerStatisticDTO> playerStatistics) {
		this.playerStatistics = playerStatistics;
	}
	public List<TeamDTO> getTeams() {
		return teams;
	}
	public void setTeams(List<TeamDTO> teams) {
		this.teams = teams;
	}
	
	
}
