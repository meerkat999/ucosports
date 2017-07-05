package co.com.meerkats.hotelturin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.data.repository.query.Param;

import co.com.meerkats.hotelturin.domain.Acompanante;

@Eager
public interface IAcompananteRepository extends JpaRepository<Acompanante,Integer> {
	
	List<Acompanante> findByClienteIdAndTipoDocumentoId(String clienteId, Integer tipoDocumentoId);

	@Query(value = "select * from acompanantes where arriendo_id in ("
			+ " select a.arriendo_id from arriendo a where a.estado_id = 1) and cliente_id = :cedula and tipodocumento_id = :tipodocumento", nativeQuery=true)
	List<Acompanante> findByClienteIdAndTipoDocumentoIdWithArriendoActive(@Param("cedula") String cedulaId, @Param("tipodocumento") Integer tipoDocumentoId);

}
