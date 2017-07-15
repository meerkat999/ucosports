package co.com.meerkats.hotelturin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.data.repository.query.Param;

import co.com.meerkats.hotelturin.domain.Servicio;

@Eager
public interface IServicioRepository extends JpaRepository<Servicio,Integer>{
	
	List<Servicio> findByEstado(Integer estado_id);
	
	@Query(value = " select * from servicioadicional where servicioadicional_id in ("
			+ " select servicioadicional_id from consumoporservicio where clienteconsumo_id in "
			+ " (select clienteconsumo_id from clienteconsumo where clienteconsumo_id = :clienteconsumoId "
			+ " and estado_id = :estadoid))", nativeQuery= true )
	Servicio findyByClienteConsumoAndEstadoId(@Param("clienteconsumoId") Integer clienteConsumoId, @Param("estadoid") Integer estado_id);
	
	@Query(value = "select * from servicioadicional where servicioadicional_id in ("
			+ " select servicioadicional_id from consumoporservicio where clienteconsumo_id in "
			+ " (select clienteconsumo_id from clienteconsumo where clienteconsumo_id = :clienteconsumoId )) ", nativeQuery= true )
	Servicio findyByClienteConsumo(@Param("clienteconsumoId") Integer clienteConsumoId);
	
}