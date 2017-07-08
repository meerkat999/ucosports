package co.com.meerkats.hotelturin.logical.Impl;

import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.Factura;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;
import co.com.meerkats.hotelturin.dto.ConsumoPorServicioDTO;
import co.com.meerkats.hotelturin.dto.FacturaDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.IConsumoPorServicioLogical;
import co.com.meerkats.hotelturin.logical.IEstadoLogical;
import co.com.meerkats.hotelturin.logical.IFacturaLogical;
import co.com.meerkats.hotelturin.repository.IFacturaRepository;

@RequestScoped
public class FacturaLogicalImpl extends LogicalCommonImpl<Factura, FacturaDTO> implements IFacturaLogical {

	@Inject
	private IFacturaRepository repository;
	
	@Inject
	private IClienteLogical clienteLogical;
	
	@Inject
	private IClienteConsumoLogical clienteConsumoLogical;
	
	@Inject
	private IEstadoLogical estadoLogical;
	
	@Inject
	private IConsumoPorServicioLogical consumoPorServicioLogical;
	
	@Override
	public FacturaDTO buildDTO(Factura entity) {
		FacturaDTO dto = null;
		if(entity != null && entity.getId() != null){
			dto = new FacturaDTO();
			dto.setClienteId(entity.getCliente().getId().getId());
			dto.setTipodocumentoId(entity.getCliente().getId().getTipoDocumento());
			dto.setFecha(entity.getFecha());
			dto.setId(entity.getId());
			dto.setValor(entity.getValor());
		}
		return dto;
	}

	private FacturaDTO buildDTOPrivateSinCheckin(Factura entity, List<ServicioDTO> listaServiciosAConsumir) {
		FacturaDTO dto = buildDTO(entity);
		dto.setClienteconsumoId(entity.getClienteConsumo().getId());
		dto.setListaServiciosAConsumir(listaServiciosAConsumir);
		return dto;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public FacturaDTO facturarConsumoClienteSinCheckin(FacturaDTO facturaDTO) throws Exception {
		
		if(facturaDTO == null){
			throw new Exception("Se está intentando facturar con un dto vacío.");
		}
		
		Cliente cliente = clienteLogical.getEntityForOtherEntity(facturaDTO.getClienteId(), facturaDTO.getTipodocumentoId());
		Estado estado = estadoLogical.getEntityForOtherEntity(StatesEnum.PAGADO.getValue());
		
		ClienteConsumoDTO clienteConsumoDTO = new ClienteConsumoDTO();
		clienteConsumoDTO.setClienteId(cliente.getId().getId());
		clienteConsumoDTO.setTipodocumentoId(cliente.getId().getTipoDocumento());
		clienteConsumoDTO.setFecha(new Date());
		clienteConsumoDTO.setSaldo(0D);
		clienteConsumoDTO.setTotal(0D);
		clienteConsumoDTO.setEstado_id(estado.getId());
		
		ClienteConsumo clienteConsumo = clienteConsumoLogical.save(clienteConsumoDTO);
		
		Factura factura = new Factura();
		factura.setCliente(cliente);
		factura.setEstado(estado);
		factura.setFecha(new Date());
		factura.setClienteConsumo(clienteConsumo);
		
		Double valor = 0d;
		
		List<ServicioDTO> listaServiciosAConsumir = facturaDTO.getListaServiciosAConsumir();
		for (ServicioDTO servicioDTO : listaServiciosAConsumir) {
			ConsumoPorServicioDTO consumoPorServicioDTO = new ConsumoPorServicioDTO();
			consumoPorServicioDTO.setClienteConsumoId(clienteConsumo.getId());
			consumoPorServicioDTO.setServicioAdicionalId(servicioDTO.getId());
			consumoPorServicioDTO.setServicioAdicionalValor(consumoPorServicioDTO.getServicioAdicionalValor());
			consumoPorServicioDTO = consumoPorServicioLogical.save(consumoPorServicioDTO);
			valor += servicioDTO.getValor();
		}
		
		factura.setValor(valor);

		factura = repository.save(factura);
		
		clienteConsumoDTO.setTotal(valor);
		clienteConsumoDTO.setId(clienteConsumo.getId());
		
		clienteConsumoDTO = clienteConsumoLogical.update(clienteConsumoDTO);
		
		if(factura == null){
			throw new Exception("Error al guardar la factura");
		}
		
		return buildDTOPrivateSinCheckin(factura, listaServiciosAConsumir);
	}

}
