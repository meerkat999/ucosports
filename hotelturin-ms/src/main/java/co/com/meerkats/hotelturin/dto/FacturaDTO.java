package co.com.meerkats.hotelturin.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class FacturaDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private ClienteDTO cliente;
	
	private HabitacionDTO habitacion;
	
	private ArriendoDTO arriendo;
	
	private ClienteConsumoDTO clienteConsumo;
	
	private String clienteId;
	
	private Integer tipodocumentoId;
	
	private Double valor;
	
	private Date fecha;
	
	private Integer arriendoId;
	
	private String habitacionId;
	
	private Integer clienteconsumoId;

	private List<ServicioDTO> listaServiciosAConsumir;
	
	private List<ConsumoPorServicioDTO> listaConsumoPorServicio;
	
	private List<MedioPagoDTO> listaMediosPago;
	
	private List<MedioPagoPorFacturaDTO> listaMediosPagoDetalles;
	
	private Double devuelta;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClienteId() {
		return clienteId;
	}

	public void setClienteId(String clienteId) {
		this.clienteId = clienteId;
	}

	public Integer getTipodocumentoId() {
		return tipodocumentoId;
	}

	public void setTipodocumentoId(Integer tipodocumentoId) {
		this.tipodocumentoId = tipodocumentoId;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Integer getArriendoId() {
		return arriendoId;
	}

	public void setArriendoId(Integer arriendoId) {
		this.arriendoId = arriendoId;
	}

	public String getHabitacionId() {
		return habitacionId;
	}

	public void setHabitacionId(String habitacionId) {
		this.habitacionId = habitacionId;
	}

	public Integer getClienteconsumoId() {
		return clienteconsumoId;
	}

	public void setClienteconsumoId(Integer clienteconsumoId) {
		this.clienteconsumoId = clienteconsumoId;
	}

	public List<ServicioDTO> getListaServiciosAConsumir() {
		return listaServiciosAConsumir;
	}

	public void setListaServiciosAConsumir(List<ServicioDTO> listaServiciosAConsumir) {
		this.listaServiciosAConsumir = listaServiciosAConsumir;
	}

	public List<MedioPagoDTO> getListaMediosPago() {
		return listaMediosPago;
	}

	public void setListaMediosPago(List<MedioPagoDTO> listaMediosPago) {
		this.listaMediosPago = listaMediosPago;
	}

	public Double getDevuelta() {
		return devuelta;
	}

	public void setDevuelta(Double devuelta) {
		this.devuelta = devuelta;
	}

	public List<MedioPagoPorFacturaDTO> getListaMediosPagoDetalles() {
		return listaMediosPagoDetalles;
	}

	public void setListaMediosPagoDetalles(List<MedioPagoPorFacturaDTO> listaMediosPagoDetalles) {
		this.listaMediosPagoDetalles = listaMediosPagoDetalles;
	}

	public ClienteDTO getCliente() {
		return cliente;
	}

	public void setCliente(ClienteDTO cliente) {
		this.cliente = cliente;
	}

	public HabitacionDTO getHabitacion() {
		return habitacion;
	}

	public void setHabitacion(HabitacionDTO habitacion) {
		this.habitacion = habitacion;
	}

	public ArriendoDTO getArriendo() {
		return arriendo;
	}

	public void setArriendo(ArriendoDTO arriendo) {
		this.arriendo = arriendo;
	}

	public ClienteConsumoDTO getClienteConsumo() {
		return clienteConsumo;
	}

	public void setClienteConsumo(ClienteConsumoDTO clienteConsumo) {
		this.clienteConsumo = clienteConsumo;
	}

	public List<ConsumoPorServicioDTO> getListaConsumoPorServicio() {
		return listaConsumoPorServicio;
	}

	public void setListaConsumoPorServicio(List<ConsumoPorServicioDTO> listaConsumoPorServicio) {
		this.listaConsumoPorServicio = listaConsumoPorServicio;
	}

}
