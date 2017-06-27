package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.dto.EstadoDTO;

public interface IEstadoLogical extends ILogicalCommon<Estado, EstadoDTO>  {

	EstadoDTO getByID(EstadoDTO estadoDTO);

}
