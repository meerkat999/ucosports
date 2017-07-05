package co.com.meerkats.hotelturin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;

import co.com.meerkats.hotelturin.domain.Arriendo;

@Eager
public interface IArriendoRepository extends JpaRepository<Arriendo,Integer> {

	Arriendo findByClienteIdAndTipodocumentoIdAndEstadoId(String clienteId, Integer tipodocumentoId, Integer estado_id);
	
	List<Arriendo> findByEstadoId(Integer estado_id);
	
	@Query(value = "select arriendo.* from arriendo left join habitacion on (arriendo.habitacion_id = habitacion.habitacion_id) "
			+ " where arriendo.arriendo_num_acompanantes + 1 < habitacion.habitacion_capacidad and arriendo.estado_id = 1 and habitacion.estado_id = 3;", nativeQuery = true)
	List<Arriendo> findByArriendosConCapacidadEnHabitacion();
	
}
