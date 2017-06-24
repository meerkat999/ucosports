package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.TipoDocumento;
import co.com.meerkats.hotelturin.dto.TipoDocumentoDTO;

public interface ITipoDocumentoLogical extends ILogicalCommon<TipoDocumento, TipoDocumentoDTO> {

	List<TipoDocumentoDTO> getAll();
	
}
