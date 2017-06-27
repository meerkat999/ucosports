package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.Acompanante;
import co.com.meerkats.hotelturin.dto.AcompananteDTO;

public interface IAcompananteLogical extends ILogicalCommon<Acompanante, AcompananteDTO> {

	AcompananteDTO add(AcompananteDTO acompananteDTO) throws Exception;


}
