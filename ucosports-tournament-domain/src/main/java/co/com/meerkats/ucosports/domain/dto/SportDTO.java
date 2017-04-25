package co.com.meerkats.ucosports.domain.dto;

import java.util.List;

public class SportDTO {

	private Integer id;
	private String name;
	private Integer numberPlayers;
	private Integer numberTimes;
	private Integer timeTimes;
	private List<String> statistics;
	
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
	public List<String> getStatistics() {
		return statistics;
	}
	public void setStatistics(List<String> statistics) {
		this.statistics = statistics;
	}
	
}
