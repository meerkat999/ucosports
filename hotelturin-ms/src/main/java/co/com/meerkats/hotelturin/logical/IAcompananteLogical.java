package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Acompanante;
import co.com.meerkats.hotelturin.dto.AcompananteDTO;

public interface IAcompananteLogical extends ILogicalCommon<Acompanante, AcompananteDTO> {

	AcompananteDTO add(AcompananteDTO acompananteDTO) throws Exception;

	AcompananteDTO searchAcompananteCheckInActive(AcompananteDTO acompananteDTO);

	AcompananteDTO addAfterCheckin(AcompananteDTO acompananteDTO) throws Exception;

	List<AcompananteDTO> buscarAcompanantesByArriendo(AcompananteDTO acompananteDTO);

}
