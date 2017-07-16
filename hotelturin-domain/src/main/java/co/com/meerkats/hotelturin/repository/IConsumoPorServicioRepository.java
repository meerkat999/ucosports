package co.com.meerkats.hotelturin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.data.repository.query.Param;

import co.com.meerkats.hotelturin.domain.ConsumoPorServicio;

@Eager
public interface IConsumoPorServicioRepository extends JpaRepository<ConsumoPorServicio,Integer> {

	@Query(value = "select * from consumoporservicio where clienteconsumo_id = :clienteconsumoid ", nativeQuery = true)
	List<ConsumoPorServicio> findByClienteConsumo(@Param("clienteconsumoid") Integer clienteconsumoId);
	
}
