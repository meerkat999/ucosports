package co.com.meerkats.ucosports.domain;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="player")
public class Player {

	@Id
	@Column(name = "player_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;
	
	@Column(name = "player_firts_name")
	private String firstName;

	@Column(name = "player_second_name")
	private String secondName;
	
	@Column(name = "player_firts_lastname")
	private String firstLastname;
	
	@Column(name = "player_second_lastname")
	private String secondLastName;
	
	@Column(name = "player_celnumber")
	private BigInteger celNumber;
	
	@Column(name = "player_identification")
	private BigInteger identificacion;
	
	@Column(name = "player_state")
	private String state;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(
			name = "team_player_inscription",
			joinColumns = {
					@JoinColumn(name="player_id")
			},
			inverseJoinColumns = {
					@JoinColumn(name="team_id"),
					@JoinColumn(name="sport_id")
			})
	private List<Team> teams;
	
	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSecondName() {
		return secondName;
	}

	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}

	public String getFirstLastname() {
		return firstLastname;
	}

	public void setFirstLastname(String firstLastname) {
		this.firstLastname = firstLastname;
	}

	public String getSecondLastName() {
		return secondLastName;
	}

	public void setSecondLastName(String secondLastName) {
		this.secondLastName = secondLastName;
	}

	public BigInteger getCelNumber() {
		return celNumber;
	}

	public void setCelNumber(BigInteger celNumber) {
		this.celNumber = celNumber;
	}

	public BigInteger getIdentificacion() {
		return identificacion;
	}

	public void setIdentificacion(BigInteger identificacion) {
		this.identificacion = identificacion;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
