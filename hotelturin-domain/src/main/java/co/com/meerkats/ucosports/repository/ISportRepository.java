package co.com.meerkats.ucosports.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.cdi.Eager;

import co.com.meerkats.ucosports.domain.Sport;

@Eager
public interface ISportRepository extends JpaRepository<Sport, Integer> {

}

