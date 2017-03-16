package co.com.meerkats.ucosports.repository;

import javax.enterprise.context.Dependent;

import org.springframework.data.jpa.repository.JpaRepository;

import co.com.meerkats.ucosports.domain.Team;

@Dependent
public interface ITeamRepository extends JpaRepository<Team, Integer>{

}
