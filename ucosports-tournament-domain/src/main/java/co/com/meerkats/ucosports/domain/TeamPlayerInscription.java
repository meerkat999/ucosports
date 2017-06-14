package co.com.meerkats.ucosports.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="team_player_inscription")
public class TeamPlayerInscription {
	
	@Id
	@Column(name = "team_player_inscription_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "sport_id")
	private Sport sport;
	
	@ManyToOne
	@JoinColumn(name = "team_id")
	private Team team;

	@ManyToOne
	@JoinColumn(name = "player_id")
	private Player player;
	
	@Column(name = "team_player_inscription_date_creation")
	private Date dateCreation;
	
	@Column(name = "team_player_inscription_state")
	private String state;
	
}
