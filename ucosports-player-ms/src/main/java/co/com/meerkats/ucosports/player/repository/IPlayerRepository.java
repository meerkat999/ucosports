package co.com.meerkats.ucosports.player.repository;

import javax.enterprise.context.Dependent;

import org.springframework.data.jpa.repository.JpaRepository;

import co.com.meerkats.ucosports.domain.Player;

@Dependent
public interface IPlayerRepository extends JpaRepository<Player, Integer> {

}

