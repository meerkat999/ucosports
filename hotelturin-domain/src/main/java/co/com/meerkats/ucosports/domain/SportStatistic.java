package co.com.meerkats.ucosports.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="sportstatistic")
public class SportStatistic {
	
	@Id
	@Column(name = "sportstatistic_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;
	
	@Column(name = "sportstatistic_name")
	private String name;
	
	@Column(name = "sportstatistic_state")
	private String state;

	@ManyToOne
	@JoinColumn(name = "sport_id")
	private Sport sport;

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Sport getSport() {
		return sport;
	}

	public void setSport(Sport sport) {
		this.sport = sport;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}
