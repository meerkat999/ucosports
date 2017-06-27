package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.Arriendo;
import co.com.meerkats.hotelturin.dto.ArriendoDTO;

public interface IArriendoLogical extends ILogicalCommon<Arriendo, ArriendoDTO> {

	ArriendoDTO getById(ArriendoDTO arriendoDTO);
	ArriendoDTO add(ArriendoDTO arriendoDTO) throws Exception;

}
