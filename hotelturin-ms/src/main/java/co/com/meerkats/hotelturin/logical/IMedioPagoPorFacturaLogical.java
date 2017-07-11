package co.com.meerkats.hotelturin.logical;

import java.util.List;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.Factura;
import co.com.meerkats.hotelturin.domain.MedioPagoPorFactura;
import co.com.meerkats.hotelturin.dto.MedioPagoDTO;
import co.com.meerkats.hotelturin.dto.MedioPagoPorFacturaDTO;

public interface IMedioPagoPorFacturaLogical extends ILogicalCommon<MedioPagoPorFactura,MedioPagoPorFacturaDTO> {

	List<MedioPagoPorFacturaDTO> save(List<MedioPagoDTO> listaMediosPago, Cliente cliente, Factura factura, Estado estado) throws Exception;


}
