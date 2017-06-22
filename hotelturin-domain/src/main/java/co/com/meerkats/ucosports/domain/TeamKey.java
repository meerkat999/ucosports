package co.com.meerkats.ucosports.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class TeamKey implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "team_id")
	private Integer id;
	
	@Column(name = "sport_id")
	private Integer sport_id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSport_id() {
		return sport_id;
	}

	public void setSport_id(Integer sport_id) {
		this.sport_id = sport_id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((sport_id == null) ? 0 : sport_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TeamKey other = (TeamKey) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (sport_id == null) {
			if (other.sport_id != null)
				return false;
		} else if (!sport_id.equals(other.sport_id))
			return false;
		return true;
	}

	
	
	
	
}
