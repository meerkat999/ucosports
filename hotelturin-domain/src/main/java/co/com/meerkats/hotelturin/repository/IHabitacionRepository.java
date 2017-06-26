package co.com.meerkats.hotelturin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.cdi.Eager;

import co.com.meerkats.hotelturin.domain.Habitacion;

@Eager
public interface IHabitacionRepository extends JpaRepository<Habitacion,String>{
	
	Habitacion findByEstado(Integer estado_id);
	Habitacion findById(String habitacion_id);
	
	
}
