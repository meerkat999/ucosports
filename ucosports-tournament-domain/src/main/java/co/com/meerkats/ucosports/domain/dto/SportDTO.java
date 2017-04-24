package co.com.meerkats.ucosports.domain.dto;

public class SportDTO {

	private String name;
	private Integer numberTeams;
	private Integer numberTimes;
	private Double timeTimes;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNumberTeams() {
		return numberTeams;
	}
	public void setNumberTeams(Integer numberTeams) {
		this.numberTeams = numberTeams;
	}
	public Integer getNumberTimes() {
		return numberTimes;
	}
	public void setNumberTimes(Integer numberTimes) {
		this.numberTimes = numberTimes;
	}
	public Double getTimeTimes() {
		return timeTimes;
	}
	public void setTimeTimes(Double timeTimes) {
		this.timeTimes = timeTimes;
	}
	
}
