package co.com.meerkats.hotelturin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.cdi.Eager;
import co.com.meerkats.hotelturin.domain.Servicio;

@Eager
public interface IServicioRepository extends JpaRepository<Servicio,Integer>{
	
	List<Servicio> findByEstado(Integer estado_id);
	
	
	
}