package co.com.meerkats.hotelturin.logical.Impl;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import co.com.meerkats.hotelturin.domain.MedioPago;
import co.com.meerkats.hotelturin.dto.MedioPagoDTO;
import co.com.meerkats.hotelturin.logical.IMedioPagoLogical;
import co.com.meerkats.hotelturin.repository.IMedioPagoRepository;

@RequestScoped
public class MedioPagoLogicalImpl extends LogicalCommonImpl<MedioPago,MedioPagoDTO> implements IMedioPagoLogical {

	@Inject
	private IMedioPagoRepository repository;

	@Override
	public MedioPagoDTO buildDTO(MedioPago entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MedioPago getEntityForOtherEntity(Integer mediopagoId) throws Exception {
		if(mediopagoId == null){
			throw new Exception("Error obteniendo un medio de pago con el dto nulo.");
		}
		MedioPago medioPago = repository.findOne(mediopagoId);
		if(medioPago == null){
			throw new Exception("Error obteniendo un medio de pago inexistente.");
		}
		return medioPago;
	}


}

