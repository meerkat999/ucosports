package co.com.meerkats.ucosports.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.cdi.Eager;

import co.com.meerkats.ucosports.domain.Team;

@Eager
public interface ITeamRepository extends JpaRepository<Team, Integer>{

}
