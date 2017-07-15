package co.com.meerkats.hotelturin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.data.repository.query.Param;

import co.com.meerkats.hotelturin.domain.ClienteConsumo;

@Eager
public interface IClienteConsumoRepository extends JpaRepository<ClienteConsumo,Integer> {

	@Query(value = "select * from clienteconsumo where cliente_id = :clienteid and "
			+ " tipodocumento_id = :tipodocumentoid and estado_id = :estadoid", nativeQuery = true)
	ClienteConsumo findByClienteAndEstado(@Param("clienteid") String clienteid, 
			@Param("tipodocumentoid") Integer tipodocumentoid,
			@Param("estadoid") Integer estadoid);

}
