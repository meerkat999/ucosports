package co.com.meerkats.hotelturin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.data.repository.query.Param;

import co.com.meerkats.hotelturin.domain.Factura;

@Eager
public interface IFacturaRepository extends JpaRepository<Factura,Integer> {

	@Query(value = "select * from factura where cliente_id = :clienteId and "
			+ " tipodocumento_id = :tipodocumentoId and arriendo_id = :arriendoId and estado_id = :estadoId", nativeQuery = true)
	Factura findByArriendoIdAndClienteIdAndTipodocumentoIdAndEstadoId(@Param("arriendoId") Integer arriendoId, 
			@Param("clienteId") String clienteId, @Param("tipodocumentoId") Integer tipodocumentoId, 
			@Param("estadoId") Integer estadoId);

}
