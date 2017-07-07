package co.com.meerkats.hotelturin.logical;

import co.com.meerkats.hotelturin.domain.Factura;
import co.com.meerkats.hotelturin.dto.FacturaDTO;

public interface IFacturaLogical extends ILogicalCommon<Factura, FacturaDTO> {

	FacturaDTO facturarConsumoClienteSinCheckin(FacturaDTO facturaDTO) throws Exception;

}
