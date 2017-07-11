package co.com.meerkats.hotelturin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.cdi.Eager;

import co.com.meerkats.hotelturin.domain.MedioPagoPorFactura;

@Eager
public interface IMedioPagoPorFacturaRepository extends JpaRepository<MedioPagoPorFactura,Integer> {
	
}