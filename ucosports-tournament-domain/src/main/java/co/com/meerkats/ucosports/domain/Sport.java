package co.com.meerkats.ucosports.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sport")
public class Sport {

	@Id
	@Column(name = "sport_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;
	
	@Column(name = "sport_name")
	private String name;
	
	@Column(name = "sport_number_players")
	private Integer numberPlayers;
	
	@Column(name = "sport_number_times")
	private Integer numberTimes;
	
	@Column(name = "sport_time_times")
	private Integer timeTimes;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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
	
}
