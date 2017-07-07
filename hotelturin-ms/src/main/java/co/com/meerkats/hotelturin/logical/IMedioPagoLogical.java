package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.MedioPago;
import co.com.meerkats.hotelturin.dto.MedioPagoDTO;

public interface IMedioPagoLogical extends ILogicalCommon<MedioPago,MedioPagoDTO> {

	MedioPago getEntityForOtherEntity(Integer mediopagoId) throws Exception;

}
