package co.com.meerkats.hotelturin.logical.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import co.com.meerkats.hotelturin.domain.Arriendo;
import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteConsumo;
import co.com.meerkats.hotelturin.domain.Estado;
import co.com.meerkats.hotelturin.domain.Factura;
import co.com.meerkats.hotelturin.domain.Habitacion;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.ConsumoPorServicioDTO;
import co.com.meerkats.hotelturin.dto.FacturaDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;
import co.com.meerkats.hotelturin.dto.MedioPagoDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;
import co.com.meerkats.hotelturin.logical.IArriendoLogical;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.IConsumoPorServicioLogical;
import co.com.meerkats.hotelturin.logical.IEstadoLogical;
import co.com.meerkats.hotelturin.logical.IFacturaLogical;
import co.com.meerkats.hotelturin.logical.IHabitacionLogical;
import co.com.meerkats.hotelturin.logical.IMedioPagoPorFacturaLogical;
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
	
	@Inject
	private IMedioPagoPorFacturaLogical medioPagoPorFacturaLogical;
	
	@Inject
	private IArriendoLogical arriendoLogical;
	
	@Inject
	private IHabitacionLogical habitacionLogical;
	
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
			dto.setDevuelta(entity.getDevuelta());
			ClienteKeyDTO keyCliente = new ClienteKeyDTO();
			keyCliente.setId(entity.getCliente().getId().getId());
			keyCliente.setTipodocumento(entity.getCliente().getId().getTipoDocumento());
			dto.setCliente(clienteLogical.getById(keyCliente));
		}
		return dto;
	}

	private FacturaDTO buildDTOPrivateSinCheckin(Factura entity, List<ConsumoPorServicioDTO> listaServiciosAConsumir) {
		FacturaDTO dto = buildDTO(entity);
		if(entity.getClienteConsumo() != null){
			dto.setClienteconsumoId(entity.getClienteConsumo().getId());
			ClienteConsumoDTO clienteConsumo = new ClienteConsumoDTO();
			clienteConsumo.setId(entity.getClienteConsumo().getId());
			dto.setClienteConsumo(clienteConsumoLogical.getById(clienteConsumo));
		}
		dto.setListaConsumoPorServicio(listaServiciosAConsumir);
		return dto;
	}
	
	private FacturaDTO buildDTOPrivateConCheckin(Factura entity, List<ConsumoPorServicioDTO> listaServiciosAConsumir) {
		FacturaDTO dto = buildDTOPrivateSinCheckin(entity, listaServiciosAConsumir);
		if(entity.getArriendo() != null){
			ArriendoDTO arriendoDTO = new ArriendoDTO();
			arriendoDTO.setId(entity.getArriendo().getId());
			dto.setArriendo(arriendoLogical.getById(arriendoDTO));
			HabitacionDTO habitacion = new HabitacionDTO();
			habitacion.setId(entity.getHabitacion().getId());
			dto.setHabitacion(habitacionLogical.getById(habitacion));
		}
		return dto;
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public FacturaDTO facturarHospejade(FacturaDTO facturaDTO) throws Exception {
		
		if(facturaDTO == null){
			throw new Exception("Se está intentando facturar con un dto vacío.");
		}
		
		Cliente cliente = clienteLogical.getEntityForOtherEntity(facturaDTO.getClienteId(), facturaDTO.getTipodocumentoId());
		Estado estado = estadoLogical.getEntityForOtherEntity(StatesEnum.PAGADO.getValue());
		Arriendo arriendo = arriendoLogical.getEntityForOtherEntity(facturaDTO.getArriendoId());
		ClienteConsumo clienteConsumo = buscarClienteConsumo(facturaDTO);
		actualizarClienteConsumo(estado, clienteConsumo);
		Habitacion habitacion = habitacionLogical.getEntityForOtherEntity(facturaDTO.getHabitacionId());
		
		Double valor = calcularValorHospedaje(arriendo, clienteConsumo, habitacion, facturaDTO.getNumeroNochesCalculado());
		Double devuelta = calcularDevuelta(valor, facturaDTO.getListaMediosPago());
		
		Factura factura = new Factura();
		factura.setArriendo(arriendo);
		factura.setCliente(cliente);
		factura.setClienteConsumo(clienteConsumo);
		factura.setDevuelta(devuelta);
		factura.setEstado(estado);
		factura.setFecha(facturaDTO.getFecha());
		factura.setHabitacion(habitacion);
		factura.setValor(valor);
		
		factura = repository.save(factura);
		
		if(factura == null){
			throw new Exception("No se pudo guardar la factura");
		}
		
		return buildDTOPrivateConCheckin(factura, null);
	}

	private void actualizarClienteConsumo(Estado estado, ClienteConsumo clienteConsumo) throws Exception {
		if(clienteConsumo != null){
			clienteConsumo.setEstado(estado);
			ClienteConsumoDTO consumo = new ClienteConsumoDTO();
			consumo.setId(clienteConsumo.getId());
			consumo.setEstado_id(estado.getId());
			consumo.setSaldo(0D);
			consumo.setTotal(clienteConsumo.getTotal());
			clienteConsumoLogical.update(consumo);
		}
	}

	private Double calcularValorHospedaje(Arriendo arriendo, ClienteConsumo clienteConsumo, Habitacion habitacion, Integer numeroNochesCalculado) throws Exception {
		Double valor = 0D;
		if(arriendo.getNumeroNoches() != null){
			valor = (habitacion.getPrecio() * arriendo.getNumeroNoches());
		}else if(numeroNochesCalculado != null){
			valor = (habitacion.getPrecio() * numeroNochesCalculado);
		}else{
			throw new Exception("No se pudo calcular el valor del monto a pagar.");
		}
		if(clienteConsumo != null){
			valor += clienteConsumo.getSaldo();
		}
		return valor;
	}

	private ClienteConsumo buscarClienteConsumo(FacturaDTO facturaDTO) {
		ClienteConsumo clienteConsumo = null;
		try {
			clienteConsumo = clienteConsumoLogical.getEntityForOtherEntity(facturaDTO.getClienteconsumoId());
		} catch (Exception e) {
			System.out.println("Info, arriendo sin cliente consumo.");
		}
		return clienteConsumo;
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
		
		ClienteConsumo clienteConsumo = clienteConsumoLogical.save(clienteConsumoDTO, StatesEnum.PAGADO.getValue());
		
		Factura factura = new Factura();
		factura.setCliente(cliente);
		factura.setEstado(estado);
		factura.setFecha(new Date());
		factura.setClienteConsumo(clienteConsumo);
		
		Double valor = 0d;
		
		List<ServicioDTO> listaServiciosAConsumir = facturaDTO.getListaServiciosAConsumir();
		List<ConsumoPorServicioDTO> listaServiciosAConsumirPersistidos = new ArrayList<>();
		for (ServicioDTO servicioDTO : listaServiciosAConsumir) {
			ConsumoPorServicioDTO consumoPorServicioDTO = new ConsumoPorServicioDTO();
			consumoPorServicioDTO.setClienteConsumoId(clienteConsumo.getId());
			consumoPorServicioDTO.setServicioAdicionalId(servicioDTO.getId());
			consumoPorServicioDTO.setServicioAdicionalValor(consumoPorServicioDTO.getServicioAdicionalValor());
			consumoPorServicioDTO = consumoPorServicioLogical.save(consumoPorServicioDTO);
			listaServiciosAConsumirPersistidos.add(consumoPorServicioDTO);
			valor += servicioDTO.getValor();
		}
		
		factura.setValor(valor);
		factura.setDevuelta(calcularDevuelta(valor, facturaDTO.getListaMediosPago()));
		factura = repository.save(factura);
		
		clienteConsumoDTO.setTotal(valor);
		clienteConsumoDTO.setId(clienteConsumo.getId());
		
		clienteConsumoLogical.update(clienteConsumoDTO);
		
		medioPagoPorFacturaLogical.save(facturaDTO.getListaMediosPago(), cliente, factura, estado);
		
		if(factura == null){
			throw new Exception("Error al guardar la factura");
		}
		
		return buildDTOPrivateSinCheckin(factura, listaServiciosAConsumirPersistidos);
	}

	private Double calcularDevuelta(Double valor, List<MedioPagoDTO> listaMediosPago) {
		Double valorMedioPagos = 0D;
		
		for (MedioPagoDTO medioPagoDTO : listaMediosPago) {
			valorMedioPagos += medioPagoDTO.getValor();
		}
		
		Double devuelta = 0D;
		
		if(valor < valorMedioPagos){
			devuelta = valorMedioPagos - valor;
		}
		return devuelta;
	}

	@Override
	public FacturaDTO getByArriendoIdAndClienteIdAndTipoDocumentoIDandEstadoId(Integer arriendoId, String clienteId,
			Integer tipodocumentoId, Integer estadoId) {
		return buildDTO(repository.findByArriendoIdAndClienteIdAndTipodocumentoIdAndEstadoId(arriendoId, clienteId, tipodocumentoId, estadoId));
	}

	@Override
	public FacturaDTO getByArriendoIdAndClienteIdAndTipoDocumentoIDandEstadoId(FacturaDTO facturaDTO) {
		return getByArriendoIdAndClienteIdAndTipoDocumentoIDandEstadoId(facturaDTO.getArriendoId(), facturaDTO.getClienteId(), facturaDTO.getTipodocumentoId(), StatesEnum.PAGADO.getValue());
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public FacturaDTO facturarHospedajeAndCheckout(FacturaDTO facturaDTO) throws Exception {
		
		if(facturaDTO == null){
			throw new Exception("Error al generar una factura con el dto nulo");
		}
		
		checkOutArriendo(facturaDTO);
		
		return facturarHospejade(facturaDTO);
	}

	private void checkOutArriendo(FacturaDTO facturaDTO) throws Exception {
		ArriendoDTO arriendoDTO = new ArriendoDTO();
		arriendoDTO.setId(facturaDTO.getArriendoId());
		arriendoLogical.checkOut(arriendoDTO);
	}

}
