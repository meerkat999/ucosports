package co.com.meerkats.hotelturin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.cdi.Eager;

import co.com.meerkats.hotelturin.domain.Arriendo;

@Eager
public interface IArriendoRepository extends JpaRepository<Arriendo,Integer> {

	Arriendo findByClienteIdAndTipodocumentoIdAndEstadoId(String clienteId, Integer tipodocumentoId, Integer estado_id);
	
	List<Arriendo> findByEstadoId(Integer estado_id);
	
}
