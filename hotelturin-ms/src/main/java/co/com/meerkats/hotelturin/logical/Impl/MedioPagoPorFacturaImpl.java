package co.com.meerkats.hotelturin.logical.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.Factura;
import co.com.meerkats.hotelturin.domain.MedioPago;
import co.com.meerkats.hotelturin.domain.MedioPagoPorFactura;
import co.com.meerkats.hotelturin.dto.MedioPagoDTO;
import co.com.meerkats.hotelturin.dto.MedioPagoPorFacturaDTO;
import co.com.meerkats.hotelturin.logical.IMedioPagoLogical;
import co.com.meerkats.hotelturin.logical.IMedioPagoPorFacturaLogical;
import co.com.meerkats.hotelturin.repository.IMedioPagoPorFacturaRepository;

@RequestScoped
public class MedioPagoPorFacturaImpl extends LogicalCommonImpl<MedioPagoPorFactura,MedioPagoPorFacturaDTO> implements IMedioPagoPorFacturaLogical {

	@Inject
	private IMedioPagoPorFacturaRepository repository;
	
	@Inject
	private IMedioPagoLogical medioPagoLogical;
	
	@Override
	public MedioPagoPorFacturaDTO buildDTO(MedioPagoPorFactura entity) {
		MedioPagoPorFacturaDTO medioPagoPorFacturaDTO = null;
		if(entity != null & entity.getId() != null){
			medioPagoPorFacturaDTO = new MedioPagoPorFacturaDTO();
			medioPagoPorFacturaDTO.setId(entity.getId());
			medioPagoPorFacturaDTO.setClienteId(entity.getCliente().getId().getId());
			medioPagoPorFacturaDTO.setTipoDocumentoId(entity.getCliente().getId().getTipoDocumento());
			medioPagoPorFacturaDTO.setEstadoId(entity.getEstado().getId());
			medioPagoPorFacturaDTO.setFacturaId(entity.getFactura().getId());
			medioPagoPorFacturaDTO.setMedioPagoId(entity.getMedioPago().getId());
			medioPagoPorFacturaDTO.setNumBauche(entity.getNumBauche());
			medioPagoPorFacturaDTO.setValor(entity.getValor());
		}
		return medioPagoPorFacturaDTO;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public List<MedioPagoPorFacturaDTO> save(List<MedioPagoDTO> listaMediosPago, Cliente cliente, Factura factura,
			Estado estado) throws Exception {
		
		if(listaMediosPago == null || listaMediosPago.isEmpty()){
			throw new Exception("Error al intentar guardar medios de pagos sin medios de pagos");
		}
		
		List<MedioPagoPorFactura> medioPagoPorFacturaDetalles = new ArrayList<>();
		
		for (MedioPagoDTO medioPagoDTO : listaMediosPago) {
			MedioPagoPorFactura medioPagoPorFactura = new MedioPagoPorFactura();
			medioPagoPorFactura.setCliente(cliente);
			medioPagoPorFactura.setEstado(estado);
			medioPagoPorFactura.setFactura(factura);
			Double valor = medioPagoDTO.getValor();
			if(valor == null || valor <= 0 ){
				throw new Exception("Error al guardar el detalle de un medio de pago con valor nulo o cero.");
			}
			medioPagoPorFactura.setValor(valor);
			String numBauche = medioPagoDTO.getNumBauche();
			if((medioPagoDTO.getNeedBauche() && numBauche == null) || (medioPagoDTO.getNeedBauche() && numBauche.isEmpty())){
				throw new Exception("Error al guardar el detalle de un medio de pago que necesita un numero de bauche y este está nulo.");
			}
			medioPagoPorFactura.setNumBauche(numBauche);
			MedioPago medioPago = medioPagoLogical.getEntityForOtherEntity(medioPagoDTO.getId());
			medioPagoPorFactura.setMedioPago(medioPago);
			medioPagoPorFactura = repository.save(medioPagoPorFactura);
			medioPagoPorFacturaDetalles.add(medioPagoPorFactura);
		}

		return listEntitiesToListDTOs(medioPagoPorFacturaDetalles);
	}

}
