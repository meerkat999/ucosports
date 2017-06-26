package co.com.meerkats.hotelturin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.data.repository.query.Param;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteKey;

@Eager
public interface IClienteRepository extends JpaRepository<Cliente, ClienteKey> {
	
	@Query(value = "select distinct MONTH(cliente_fecha_registro) "
			+ "from cliente where YEAR(cliente_fecha_registro) = :year ", nativeQuery = true)
	List<Integer> getListMonthsWithClients(@Param("year") Integer year);
	
	@Query(value = "select distinct YEAR(cliente_fecha_registro) "
			+ "from cliente", nativeQuery = true)
	List<Integer> getListYearsWithClients();
	
}

