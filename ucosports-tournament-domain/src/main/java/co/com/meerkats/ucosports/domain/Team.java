package co.com.meerkats.ucosports.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "team")
public class Team {

	@Id
	@Column(name = "team_id")
	private Integer id;
	
	@Column(name = "team_name")
	private String teamName;
	
	@Column(name = "team_state")
	private String state;
	
	@Column(name = "team_date_creation")
	private Date dateCreation;
	
	@ManyToOne
	@JoinColumn(name = "sport_id")
	private Sport sport;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

}
