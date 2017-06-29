package co.com.meerkats.hotelturin.logical;

import java.util.List;


import co.com.meerkats.hotelturin.domain.Servicio;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.ListServicioDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;

public interface IServicioLogical  extends ILogicalCommon<Servicio,ServicioDTO> {
	
	List<ServicioDTO> getAll();
	ListServicioDTO getByState(EstadoDTO estado);	
	ServicioDTO add(ServicioDTO servicio) throws Exception;
	ServicioDTO getById(ServicioDTO servicio);
	ServicioDTO update(ServicioDTO servicio) throws Exception;
	ServicioDTO desactivar(ServicioDTO servicio) throws Exception;
	ServicioDTO activar(ServicioDTO servicio) throws Exception;
	
} 


