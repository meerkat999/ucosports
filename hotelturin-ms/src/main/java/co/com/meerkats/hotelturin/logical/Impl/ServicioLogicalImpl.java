package co.com.meerkats.hotelturin.logical.Impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import co.com.meerkats.hotelturin.domain.Servicio;
import co.com.meerkats.hotelturin.domain.constants.StatesEnum;
import co.com.meerkats.hotelturin.dto.EstadoDTO;
import co.com.meerkats.hotelturin.dto.ListServicioDTO;
import co.com.meerkats.hotelturin.dto.ServicioDTO;
import co.com.meerkats.hotelturin.logical.IConsumoPorServicioLogical;
import co.com.meerkats.hotelturin.logical.IServicioLogical;
import co.com.meerkats.hotelturin.repository.IServicioRepository;

@RequestScoped
public class ServicioLogicalImpl extends LogicalCommonImpl<Servicio,ServicioDTO> implements IServicioLogical {

	@Inject
	private IServicioRepository repository;
	
	@Inject
	private IConsumoPorServicioLogical consumoPorServicioLogical;

	@Override
	public List<ServicioDTO> getAll() {
		List<Servicio> listaServicios = repository.findAll();
		return listEntitiesToListDTOs(listaServicios);
	}

	@Override
	public ListServicioDTO getByState(EstadoDTO estado) {
		ListServicioDTO  listServicioDTO = null;
		Integer estado_id = estado.getId();
		if(estado_id !=null){
			listServicioDTO  = new ListServicioDTO();
			List<Servicio> listaServicios = repository.findByEstado(estado_id);
			List<ServicioDTO> listEntitiesToListDTOs = listEntitiesToListDTOs(listaServicios);
			listServicioDTO.setlistaServicios(listEntitiesToListDTOs);
		}	
		return listServicioDTO;
	}

	@Override
	public ServicioDTO buildDTO(Servicio entity) {
		ServicioDTO  servicioDTO = null;
		if(entity != null && entity.getId() != null){
			servicioDTO = new ServicioDTO();				
			servicioDTO.setId(entity.getId());
			servicioDTO.setValor(entity.getValor());
			servicioDTO.setNombre(entity.getNombre());
			servicioDTO.setEstado(entity.getEstado());
		}
		return servicioDTO;
	
	}

	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	@Override
	public ServicioDTO add(ServicioDTO serviciodto) throws Exception {
		Servicio servicio = new Servicio();			
		servicio.setEstado(StatesEnum.ACTIVO.getValue());
		servicio.setValor(serviciodto.getValor());		
		servicio.setNombre(serviciodto.getNombre());		
		return buildDTO(repository.save(servicio));
		
	}
	@Override
	public ServicioDTO getById(ServicioDTO serviciodto) {
		Servicio servicio=null;
		Integer servicio_id=serviciodto.getId();
		if(servicio_id != null){
			servicio= repository.findOne(servicio_id);
		}	
		return buildDTO(servicio);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ServicioDTO update(ServicioDTO servicio) throws Exception {
		Servicio servicioEntity = repository.findOne(servicio.getId());
		if(servicioEntity == null){
			throw new Exception("Error, se está intentando editar un servicio inexistente");
		}
		servicioEntity.setEstado(servicio.getEstado());
		servicioEntity.setNombre(servicio.getNombre());
		servicioEntity.setValor(servicio.getValor());
		servicioEntity = repository.save(servicioEntity);
		if(servicioEntity == null){
			throw new Exception("Error al intentar editar el servicio.");
		}
		return buildDTO(repository.save(servicioEntity));
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ServicioDTO desactivar(ServicioDTO servicio) throws Exception {
		Servicio servicioEntity = repository.findOne(servicio.getId());
		if(servicioEntity == null){
			throw new Exception("Error, se está intentando editar un servicio inexistente");
		}
		servicioEntity.setEstado(StatesEnum.INACTIVO.getValue());		
		servicioEntity = repository.save(servicioEntity);
		if(servicioEntity == null){
			throw new Exception("Error al desactivar el servicio.");
		}
		return buildDTO(repository.save(servicioEntity));
	}
	
	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ServicioDTO activar(ServicioDTO servicio) throws Exception {
		Servicio servicioEntity = repository.findOne(servicio.getId());
		if(servicioEntity == null){
			throw new Exception("Error, se está intentando editar un servicio inexistente");
		}
		servicioEntity.setEstado(StatesEnum.ACTIVO.getValue());		
		servicioEntity = repository.save(servicioEntity);
		if(servicioEntity == null){
			throw new Exception("Error al Activar el servicio.");
		}
		return buildDTO(repository.save(servicioEntity));
	}

	@Override
	public Servicio getEntityForOtherEntity(Integer clienteConsumoId) throws Exception {
		if(clienteConsumoId == null){
			throw new Exception("Error al intentar obtener un servicio con el dto nulo.");
		}
		Servicio servicio = repository.findOne(clienteConsumoId);
		if(servicio == null){
			throw new Exception("Error al intentar obtener un servicio inexistente.");
		}
		return servicio;
	}

	@Override
	public ServicioDTO findyByClienteConsumoAndEstadoId(Integer clienteConsumoId, Integer estadoId) {
		return buildDTO(repository.findyByClienteConsumoAndEstadoId(clienteConsumoId, estadoId));
	}
	
	@Override
	public ServicioDTO findyByClienteConsumo(Integer clienteConsumoId) {
		return buildDTO(repository.findyByClienteConsumo(clienteConsumoId));
	}

	@Override
	public File exportAllCount() {
		File file = null;
		try {
			List<ServicioDTO> all = findAll();
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

	private void buildRows(List<ServicioDTO> all, XSSFSheet sheet, ServicioDTO c) {
		XSSFRow row = sheet.createRow(sheet.getLastRowNum() + 1);
		Long count = consumoPorServicioLogical.countService(c.getId());
		createRows(c, row, count);
		
	}

	private void createRows(ServicioDTO c, XSSFRow row, Long count) {
		row.createCell(0).setCellValue(c.getId());
		row.createCell(1).setCellValue(c.getNombre());
		row.createCell(2).setCellValue(c.getValor());
		row.createCell(3).setCellValue(count);
		row.createCell(4).setCellValue(c.getEstado());
	}

	private void createHeaders(XSSFSheet sheet) {
		XSSFRow titulos = sheet.createRow(0);
		titulos.createCell(0).setCellValue("# Servicio Adicional");
		titulos.createCell(1).setCellValue("Nombre");
		titulos.createCell(2).setCellValue("Precio");
		titulos.createCell(3).setCellValue("# de Veces Consumido");
		titulos.createCell(4).setCellValue("Estado");
	}

	private List<ServicioDTO> findAll() {
		return listEntitiesToListDTOs(repository.findAll());
	}







}
