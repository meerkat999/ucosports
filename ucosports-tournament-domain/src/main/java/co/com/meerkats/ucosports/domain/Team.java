package co.com.meerkats.ucosports.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "team")
public class Team {

	@EmbeddedId
	private TeamKey id;
	
	public TeamKey getId() {
		return id;
	}

	public void setId(TeamKey id) {
		this.id = id;
	}

	@Column(name = "team_name")
	private String teamName;
	
	@Column(name = "team_state")
	private String state;
	
	@Column(name = "team_date_creation")
	private Date dateCreation;
	
	@ManyToOne
	@JoinColumn(name = "sport_id", insertable = false, updatable = false)
	private Sport sport;
	
	@ManyToMany(mappedBy = "teams")
	private List<Player> players;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getDateCreation() {
		return dateCreation;
	}

	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}

	public Sport getSport() {
		return sport;
	}

	public void setSport(Sport sport) {
		this.sport = sport;
	}

	public List<Player> getPlayers() {
		return players;
	}

	public void setPlayers(List<Player> players) {
		this.players = players;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

}
