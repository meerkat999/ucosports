package co.com.meerkats.hotelturin.logical.Impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import co.com.meerkats.hotelturin.domain.Arriendo;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.AcompananteDTO;
import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.dto.ClienteConsumoDTO;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.FacturaDTO;
import co.com.meerkats.hotelturin.dto.HabitacionDTO;
import co.com.meerkats.hotelturin.dto.ListArriendoDTO;
import co.com.meerkats.hotelturin.logical.IAcompananteLogical;
import co.com.meerkats.hotelturin.logical.IArriendoLogical;
import co.com.meerkats.hotelturin.logical.IClienteConsumoLogical;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.IEstadoLogical;
import co.com.meerkats.hotelturin.logical.IFacturaLogical;
import co.com.meerkats.hotelturin.logical.IHabitacionLogical;
import co.com.meerkats.hotelturin.repository.IArriendoRepository;
import co.com.meerkats.hotelturin.utils.DateUtil;

@RequestScoped
public class ArriendoLogicalImpl extends LogicalCommonImpl<Arriendo, ArriendoDTO> implements IArriendoLogical {
	
	@Inject
	private IArriendoRepository repository;
	
	@Inject
	private IHabitacionLogical habitacionLogical;
	
	@Inject
	private IClienteLogical clienteLogical;
	
	@Inject
	private IAcompananteLogical acompananteLogical;
	
	@Inject
	private IEstadoLogical estadoLogical;
	
	@Inject
	private IClienteConsumoLogical clienteConsumoLogical;
	
	@Inject
	private IFacturaLogical facturaLogical;
	
	@Override
	public ArriendoDTO buildDTO(Arriendo entity) {
		ArriendoDTO arriendoDTO = null;
		if(entity != null && entity.getId() != null){
			arriendoDTO = new ArriendoDTO();
			arriendoDTO.setId(entity.getId());
			arriendoDTO.setClienteId(entity.getClienteId());
			arriendoDTO.setDateCheckin(entity.getDateCheckin());
			arriendoDTO.setDateCheckout(entity.getDateCheckout());
			arriendoDTO.setEstadoId(entity.getEstadoId());
			arriendoDTO.setFecha(entity.getFecha());
			arriendoDTO.setHabitacionId(entity.getHabitacionId());
			arriendoDTO.setNumeroAcompanantes(entity.getNumeroAcompanantes());
			arriendoDTO.setNumeroNoches(entity.getNumeroNoches());
			arriendoDTO.setTipodocumentoId(entity.getTipodocumentoId());
			ClienteConsumoDTO clienteConsumo = buscarConsumo(entity);
			ClienteDTO cliente = buscarCliente(entity);
			HabitacionDTO habitacion = buscarHabitacion(entity);
			arriendoDTO.setHabitacion(habitacion);
			arriendoDTO.setCliente(cliente);
			arriendoDTO.setClienteConsumo(clienteConsumo);
			List<AcompananteDTO> acompanantes = buscarAcompanantes(entity);
			arriendoDTO.setAcompanantesDTO(acompanantes);
		}
		return arriendoDTO;
	}

	private List<AcompananteDTO> buscarAcompanantes(Arriendo entity) {
		AcompananteDTO acompananteDTO = new AcompananteDTO();
		acompananteDTO.setArriendoId(entity.getId());
		List<AcompananteDTO> acompanantes = acompananteLogical.buscarAcompanantesByArriendo(acompananteDTO);
		return acompanantes;
	}

	private HabitacionDTO buscarHabitacion(Arriendo entity) {
		HabitacionDTO habitaciondto = new HabitacionDTO();
		habitaciondto.setId(entity.getHabitacionId());
		HabitacionDTO habitacion = habitacionLogical.getById(habitaciondto);
		return habitacion;
	}

	private ClienteDTO buscarCliente(Arriendo entity) {
		ClienteKeyDTO key = new ClienteKeyDTO();
		key.setId(entity.getClienteId());
		key.setTipodocumento(entity.getTipodocumentoId());
		ClienteDTO cliente = clienteLogical.getById(key);
		return cliente;
	}

	private ClienteConsumoDTO buscarConsumo(Arriendo entity) {
		ClienteConsumoDTO clienteConsumo = null;
		try {
			clienteConsumo = clienteConsumoLogical.getClienteConsumoByClienteIdAndTipodocumentoidDTO(entity.getClienteId(), entity.getTipodocumentoId());
		} catch (Exception e) {
			System.out.println("INFO No se obtuvo cliente consumo para el arriendo");
		}
		return clienteConsumo;
	}

	@Override
	public ArriendoDTO getById(ArriendoDTO arriendoDTO) {
		Arriendo arriendo = null;
		if(arriendoDTO != null && arriendoDTO.getId() != null){
			arriendo = (repository.findOne(arriendoDTO.getId()));
		}
		return buildDTO(arriendo);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ArriendoDTO add(ArriendoDTO arriendoDTO) throws Exception {
		
		ArriendoDTO respuesta = null;
		
		if(arriendoDTO == null){
			throw new Exception("Error al intentar guardar un arriendo teniendo el dto nulo.");
		}
		
		String cedula = arriendoDTO.getClienteId();
		Integer tipodocumentoId = arriendoDTO.getTipodocumentoId();
		String habitacionId = arriendoDTO.getHabitacionId();
		List<ClienteDTO> acompanantes = arriendoDTO.getAcompanantes();
		
		validarHabitacion(habitacionId);
		clienteLogical.validarTipoDocumentoYCliente(cedula, tipodocumentoId);
		validarCheckInActivoCliente(cedula, tipodocumentoId);

		Arriendo arriendo = new Arriendo();
		arriendo.setClienteId(arriendoDTO.getClienteId());
		arriendo.setTipodocumentoId(arriendoDTO.getTipodocumentoId());
		arriendo.setEstadoId(StatesEnum.ACTIVO.getValue());
		arriendo.setHabitacionId(arriendoDTO.getHabitacionId());
		arriendo.setDateCheckin(new Date());
		arriendo.setFecha(new Date());
		arriendo.setNumeroNoches(arriendoDTO.getNumeroNoches());
		arriendo.setNumeroAcompanantes(arriendoDTO.getAcompanantes().size());
		arriendo.setDateCheckout(null);
		arriendo = repository.save(arriendo);
		
		setAcompanantes(acompanantes, arriendo);
		
		ocuparHabitacion(habitacionId);
		
		respuesta = buildDTO(arriendo);
		return respuesta;
	}

	private void ocuparHabitacion(String habitacionId) throws Exception {
		HabitacionDTO habitacionDTO = new HabitacionDTO();
		habitacionDTO.setId(habitacionId);
		if(habitacionLogical.ocuparHabitacion(habitacionDTO) == null){
			throw new Exception("Error al ocupar una habitación en el momento de la creación del checkin.");
		}
	}

	private void setAcompanantes(List<ClienteDTO> acompanantes, Arriendo arriendo) throws Exception {
		for (ClienteDTO cliente : acompanantes) {
			AcompananteDTO acompananteDTO = new AcompananteDTO();
			acompananteDTO.setCedulaId(cliente.getId().getId());
			acompananteDTO.setTipoDocumentoId(cliente.getId().getTipodocumento());
			acompananteDTO.setArriendoId(arriendo.getId());
			acompananteLogical.add(acompananteDTO);
		}
	}

	private void validarCheckInActivoCliente(String cedula, Integer tipodocumentoId) throws Exception {
		ClienteKeyDTO keyDto = new ClienteKeyDTO();
		keyDto.setId(cedula);
		keyDto.setTipodocumento(tipodocumentoId);
		if(getByClienteKeyCheckInActive(keyDto) != null){
			throw new Exception("Error al intentar guardar un arriendo a un cliente con checkin aún activo.");
		};
	}

	private void validarHabitacion(String habitacionId) throws Exception {
		HabitacionDTO habitacionDTO = new HabitacionDTO();
		habitacionDTO.setId(habitacionId);
		HabitacionDTO habitacionEncontrada = habitacionLogical.getById(habitacionDTO);
		if(habitacionEncontrada == null){
			throw new Exception("Error al intentar guardar un arriendo con una habitación inexistente.");
		}
		if(habitacionEncontrada.getEstado() != StatesEnum.ACTIVO.getValue()){
			throw new Exception("Error al intentar guardar un arriendo con una habitación que no está activa.");
		}
	}

	@Override
	public ArriendoDTO getByClienteKeyCheckInActive(ClienteKeyDTO clienteKeyDTO) throws Exception {
		ArriendoDTO dto = null;
		if(clienteKeyDTO != null && clienteKeyDTO.getId() != null && clienteKeyDTO.getTipodocumento() != null){
			clienteLogical.validarTipoDocumentoYCliente(clienteKeyDTO.getId() , clienteKeyDTO.getTipodocumento());
			dto = buildDTO(repository.findByClienteIdAndTipodocumentoIdAndEstadoId(clienteKeyDTO.getId(), clienteKeyDTO.getTipodocumento(), StatesEnum.ACTIVO.getValue()));
		}
		return dto;
	}

	@Override
	public ListArriendoDTO getByState(ArriendoDTO arriendoDTO) { 
	    ListArriendoDTO dto = null; 
	    if(arriendoDTO != null && arriendoDTO.getEstadoId() != null){ 
	      Integer estadoId = arriendoDTO.getEstadoId(); 
	      EstadoDTO estadoDTO = new EstadoDTO(); 
	      estadoDTO.setId(estadoId); 
	      if(estadoLogical.getByID(estadoDTO) != null){ 
	        dto = new ListArriendoDTO(); 
	        List<Arriendo> arriendoActivos = repository.findByEstadoId(estadoId); 
	        dto.setListaArriendos(listEntitiesToListDTOs(arriendoActivos)); 
	      } 
	    } 
	    return dto; 
	}
	
	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ArriendoDTO checkOut(ArriendoDTO arriendoDTO) throws Exception {
		
		if(arriendoDTO == null){
			throw new Exception("Error al intentar generar un checkIn teniendo el dto nulo.");
		}
		
		Arriendo arriendo = repository.findOne(arriendoDTO.getId());
		
		validarEstadoYCheckout(arriendo);
		
		arriendo.setDateCheckout(new Date());
		arriendo.setEstadoId(StatesEnum.INACTIVO.getValue());
		
		arriendo = repository.save(arriendo);
		
		HabitacionDTO habitacionDTO = new HabitacionDTO();
		habitacionDTO.setId(arriendo.getHabitacionId());
		habitacionLogical.desocuparHabitacion(habitacionDTO);
		
		ClienteKeyDTO key = new ClienteKeyDTO();
		key.setId(arriendo.getClienteId());
		key.setTipodocumento(arriendo.getTipodocumentoId());
		
		//sendCorreo(arriendo, key);
		
		return buildDTO(arriendo);
	}

//	private void sendCorreo(Arriendo arriendo, ClienteKeyDTO key) throws Exception, IOException {
//		ClienteDTO clienteDTO = clienteLogical.getById(key);
//		validarTipoDocumentoYCliente(arriendo.getClienteId(), arriendo.getTipodocumentoId());
//		
//		try {
//			if(clienteDTO.getCorreo() != null){
//				String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
//			            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
//				
//				Pattern pattern = Pattern.compile(PATTERN_EMAIL);
//		        Matcher matcher = pattern.matcher(clienteDTO.getCorreo());
//		        boolean esCorreo = matcher.matches();
//		        if(esCorreo == true){
//		        	EmailSender emailSender = new EmailSender();
//		        	emailSender.send(clienteDTO.getCorreo());
//		        }
//			}
//		} catch (Exception e) {
//			System.out.println("No se pudo enviar el correo");
//		}
//		
//		
//	}

	private void validarEstadoYCheckout(Arriendo arriendo) throws Exception {
		if(arriendo == null){
			throw new Exception("Error al intentar generar un checkIn a un arriendo inexistente.");
		}
		
		if(!StatesEnum.ACTIVO.getValue().equals(arriendo.getEstadoId())){
			throw new Exception("Error al intentar generar un checkIn a un arriendo inactivo.");
		}
		
		if(arriendo.getDateCheckout() != null){
			throw new Exception("Error al intentar generar un checkIn con un checkout ya generado.");
		}
	}
	
	private List<ArriendoDTO> findAll() {
		return listEntitiesToListDTOs(repository.findAll());
	}

	@Override
	public File exportAll() {
		File file = null;
		try {
			List<ArriendoDTO> all = findAll();
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet();
			sheet.setDefaultColumnWidth(20);
			createHeaders(sheet);
			all.stream().forEach(c -> {
				buildRows(all, sheet, c);
			});
			file = new File("pruebaHospedajes.xlsx");
			FileOutputStream fileOutputStream = new FileOutputStream(file);
			workbook.write(fileOutputStream);
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return file;
	}

	private void createHeaders(XSSFSheet sheet) {
		XSSFRow titulos = sheet.createRow(0);
		titulos.createCell(0).setCellValue("# Check-in");
		titulos.createCell(1).setCellValue("Fecha Check-in");
		titulos.createCell(2).setCellValue("Habitacion");
		titulos.createCell(3).setCellValue("Tipo Documento");
		titulos.createCell(4).setCellValue("Cedula");
		titulos.createCell(5).setCellValue("Nombre");
		titulos.createCell(6).setCellValue("Fecha Nacimiento");
		titulos.createCell(7).setCellValue("Celular");
		titulos.createCell(8).setCellValue("Num Acompanantes");
		titulos.createCell(9).setCellValue("Num Noches Definidas");
		titulos.createCell(10).setCellValue("Estado");
		titulos.createCell(11).setCellValue("Fecha Check-out");
	}
	
	private void buildRows(List<ArriendoDTO> all, XSSFSheet sheet, ArriendoDTO c) {
		XSSFRow row = sheet.createRow(sheet.getLastRowNum() + 1);
		createRows(c, row, c.getCliente());
		c.getAcompanantesDTO().stream().forEach(a -> {
			XSSFRow row2 = sheet.createRow(sheet.getLastRowNum() + 1);
			createRows(c, row2, a.getCliente());
		});
	}

	private void createRows(ArriendoDTO c, XSSFRow row, ClienteDTO clienteDTO) {
		row.createCell(0).setCellValue(c.getId());
		row.createCell(1).setCellValue(DateUtil.dateToString(c.getDateCheckin(), DateUtil.FORMATO_DOS));
		row.createCell(2).setCellValue(c.getHabitacionId());
		row.createCell(3).setCellValue(clienteDTO.getId().getTipodocumento());
		row.createCell(4).setCellValue(clienteDTO.getId().getId());
		row.createCell(5).setCellValue(clienteDTO.getNombreCompleto());
		row.createCell(6).setCellValue(DateUtil.dateToString(clienteDTO.getFechaNacimiento(), DateUtil.FORMATO_DOS));
		row.createCell(7).setCellValue(clienteDTO.getCelular());
		row.createCell(8).setCellValue(c.getNumeroAcompanantes());
		if(c.getNumeroNoches() != null || c.getNumeroNoches() == 0){
			row.createCell(9).setCellValue(c.getNumeroNoches());
		}else{
			if(c.getDateCheckout() != null){
				row.createCell(9).setCellValue(DateUtil.daysBetween(c.getDateCheckout(), c.getDateCheckin()));
			}
		}
		row.createCell(10).setCellValue(c.getEstadoId());
		row.createCell(11).setCellValue(DateUtil.dateToString(c.getDateCheckout(), DateUtil.FORMATO_DOS));
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ArriendoDTO addNumAcompanantes(ArriendoDTO arriendoDTO, Integer more) throws Exception {
		if(arriendoDTO == null || arriendoDTO.getId() == null){
			throw new Exception("Error al intentar sumar al numero de acompanantes con un dto nulo.");
		}
		Arriendo arriendo = repository.findOne(arriendoDTO.getId());
		validarCapacidadHabitacion(arriendo);
		validarEstadoYCheckout(arriendo);
		arriendo.setNumeroAcompanantes(arriendo.getNumeroAcompanantes() + 1);
		return buildDTO(repository.save(arriendo));
	}

	private void validarCapacidadHabitacion(Arriendo arriendo) throws Exception {
		HabitacionDTO habitacion = buscarHabitacion(arriendo);
		if(habitacion == null || habitacion.getEstado() == StatesEnum.INACTIVO.getValue()){
			throw new Exception("No se puede añadir el acompañante en una habitación inexistente o inactiva");
		}
		if(habitacion.getCapacidad() == arriendo.getNumeroAcompanantes()){
			throw new Exception("No se puede añadir el acompañante en una habitación que no suple su capacidad");
		}
	}

	@Override
	public List<ArriendoDTO> findByArriendosConCapacidadEnHabitacion() {
		return listEntitiesToListDTOs(repository.findByArriendosConCapacidadEnHabitacion());
	}

	@Override
	public Arriendo getEntityForOtherEntity(Integer arriendoId) throws Exception {
		
		if(arriendoId == null){
			throw new Exception("No se puede obtener un arriendo con el dto nulo.");
		}
		
		Arriendo arriendo = repository.findOne(arriendoId);
		
		if(arriendo == null){
			throw new Exception("No se puedo buscar un arriendo inexistente.");
		}
		
		return arriendo;
	}

	@Override
	public List<ArriendoDTO> getByStateAndNoHaveFactura() {
		ArriendoDTO arriendoDTO = new ArriendoDTO();
		arriendoDTO.setEstadoId(StatesEnum.ACTIVO.getValue());
		ListArriendoDTO listaArriendosActivos = getByState(arriendoDTO);
		List<ArriendoDTO> respuesta = new ArrayList<>();
		listaArriendosActivos.getListaArriendos().stream().forEach(a -> {
			FacturaDTO factura = facturaLogical.getByArriendoIdAndClienteIdAndTipoDocumentoIDandEstadoId(a.getId(), a.getClienteId(), a.getTipodocumentoId(), StatesEnum.PAGADO.getValue());
			if(factura == null){
				respuesta.add(a);
			}
		});
		return respuesta;
	}

	@Override
	public ArriendoDTO getByRoomActive(HabitacionDTO habitacionDTO) {
		ArriendoDTO arriendodto = null;		
		if(habitacionDTO != null && habitacionDTO.getId() != null){				
			Arriendo arriendoEncontrado = repository.findByHabitacionIdAndEstadoId(habitacionDTO.getId(), StatesEnum.ACTIVO.getValue());
			arriendodto = buildDTO(arriendoEncontrado);
		}
		return arriendodto;
	}
	

}
