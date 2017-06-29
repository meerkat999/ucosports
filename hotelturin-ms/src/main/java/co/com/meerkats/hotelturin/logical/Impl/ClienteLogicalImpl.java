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

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.domain.ClienteKey;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.TipoDocumentoDTO;
import co.com.meerkats.hotelturin.dto.utils.DateDTO;
import co.com.meerkats.hotelturin.dto.utils.ListDateDTO;
import co.com.meerkats.hotelturin.logical.IClienteLogical;
import co.com.meerkats.hotelturin.logical.ITipoDocumentoLogical;
import co.com.meerkats.hotelturin.repository.IClienteRepository;
import co.com.meerkats.hotelturin.utils.DateUtil;

@RequestScoped
public class ClienteLogicalImpl extends LogicalCommonImpl<Cliente, ClienteDTO> implements IClienteLogical {

	@Inject
	private IClienteRepository repository;
	
	@Inject
	private ITipoDocumentoLogical tipoDocumentoLogical;

	@Override
	public ClienteDTO buildDTO(Cliente entity) {
		ClienteDTO clienteDTO = null;
		if(entity != null && entity.getId() != null){
			clienteDTO = new ClienteDTO();
			ClienteKeyDTO id = new ClienteKeyDTO();
			id.setId(entity.getId().getId());
			id.setTipodocumento(entity.getId().getTipoDocumento());
			clienteDTO.setId(id);
			clienteDTO.setNombreCompleto(entity.getNombreCompleto());
			clienteDTO.setCelular(entity.getCelular());
			clienteDTO.setApellidoUno(entity.getApellidoUno());
			clienteDTO.setNombreUno(entity.getNombreUno());
			clienteDTO.setFechaRegistro(entity.getFechaRegistro());
			clienteDTO.setNombreDos(entity.getNombreDos());
			clienteDTO.setApellidoDos(entity.getApellidoDos());
			clienteDTO.setFechaNacimiento(entity.getFechaNacimiento());
		}
		return clienteDTO;
	}

	@Override
	public ClienteDTO getById(ClienteKeyDTO key) {
		ClienteKey keyEntity = new ClienteKey();
		keyEntity.setId(key.getId());
		keyEntity.setTipoDocumento(key.getTipodocumento());
		Cliente cliente = getById(keyEntity);
		return buildDTO(cliente);
	}
	
	private Cliente getById(ClienteKey key){
		return repository.findOne(key);
	}

	@Override
	@Transactional(value=TxType.REQUIRED, rollbackOn=Exception.class)
	public ClienteDTO add(ClienteDTO clientedto) throws Exception {
		
		Cliente cliente = new Cliente();
		cliente.setApellidoUno(clientedto.getApellidoUno());
		cliente.setCelular(clientedto.getCelular());
		cliente.setNombreUno(clientedto.getNombreUno());
		cliente.setNombreDos(clientedto.getNombreDos());
		cliente.setApellidoDos(clientedto.getApellidoDos());
		
		validarTipoDocumento(clientedto);
		
		ClienteKey id = new ClienteKey();
		id.setId(clientedto.getId().getId());
		id.setTipoDocumento(clientedto.getId().getTipodocumento());
		
		validarExistenciaUsuario(id);
		
		cliente.setId(id);
		cliente.setFechaRegistro(new Date());
		cliente.setNombreCompleto(buildNombreCompleto(clientedto));
		cliente.setCorreo(clientedto.getCorreo());
		cliente.setFechaNacimiento(clientedto.getFechaNacimiento());
		
		return buildDTO(repository.save(cliente));
	}

	private String buildNombreCompleto(ClienteDTO clientedto) {
		String nombreCompleto = clientedto.getNombreUno() + " " + clientedto.getApellidoUno();
		if(clientedto.getNombreDos() != null){
			nombreCompleto = clientedto.getNombreUno() + " " + clientedto.getNombreDos() + " " + clientedto.getApellidoUno();
		}
		if(clientedto.getApellidoDos() != null){
			nombreCompleto = clientedto.getNombreUno() + " " + clientedto.getApellidoUno() + " " + clientedto.getApellidoDos();
		}
		if(clientedto.getNombreDos() != null && clientedto.getApellidoDos() != null){
			nombreCompleto = clientedto.getNombreUno() + " " + clientedto.getNombreDos() + " " + clientedto.getApellidoUno() + " " + clientedto.getApellidoDos();
		}
		return nombreCompleto;
	}

	private void validarExistenciaUsuario(ClienteKey id) throws Exception {
		if(repository.findOne(id) != null){
			throw new Exception("Ya existe un cliente con esa cédula.");
		}
	}

	private void validarTipoDocumento(ClienteDTO clientedto) throws Exception {
		TipoDocumentoDTO documentoDTO = new TipoDocumentoDTO();
		documentoDTO.setId(clientedto.getId().getTipodocumento());
		if(tipoDocumentoLogical.getById(documentoDTO) == null){
			throw new Exception("No se puede registrar un cliente con un tipo de documento inexistente.");
		}
	}

	@Override
	public ListDateDTO getMonthsWithClients(DateDTO date) {
		List<DateDTO> dateDTOs = new ArrayList<>();
		if(date != null && date.getYear() != null){
			List<Integer> listMonthsWithClients = repository.getListMonthsWithClients(date.getYear());
			if(listMonthsWithClients != null && !listMonthsWithClients.isEmpty()){
				listMonthsWithClients.stream().forEach(m -> {
					DateDTO dateDTO = new DateDTO();
					dateDTO.setMonth(m);
					dateDTOs.add(dateDTO);
				});	
			}
		}
		ListDateDTO lista = new ListDateDTO();
		lista.setListaFechas(dateDTOs);
		return lista;
	}

	@Override
	public List<DateDTO> getYearsWithClients() {
		List<DateDTO> dateDTOs = new ArrayList<>();
		List<Integer> listYearsWithClients = repository.getListYearsWithClients();
		if(listYearsWithClients != null && !listYearsWithClients.isEmpty()){
			listYearsWithClients.stream().forEach(y -> {
				DateDTO dateDTO = new DateDTO();
				dateDTO.setYear(y);
				dateDTOs.add(dateDTO);
			});
		}
		return dateDTOs;
	}

	@Override
	public File exportAll() {
		File file = null;
		try {
			List<Cliente> all = repository.findAll();
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet();
			sheet.setDefaultColumnWidth(20);
			createHeaders(sheet);
			all.stream().forEach(c -> {
				buildRows(all, sheet, c);
			});
			file = new File("prueba.xlsx");
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
		titulos.createCell(0).setCellValue("Fecha Registro");
		titulos.createCell(1).setCellValue("Tipo Documento");
		titulos.createCell(2).setCellValue("Cedula");
		titulos.createCell(3).setCellValue("Nombre Completo");
		titulos.createCell(4).setCellValue("Primer Nombre");
		titulos.createCell(5).setCellValue("Segundo Nombre");
		titulos.createCell(6).setCellValue("Primer Apellido");
		titulos.createCell(7).setCellValue("Segundo Apellido");
		titulos.createCell(8).setCellValue("Fecha Nacimiento");
		titulos.createCell(9).setCellValue("Celular");
		titulos.createCell(10).setCellValue("Correo");
	}

	private void buildRows(List<Cliente> all, XSSFSheet sheet, Cliente c) {
		XSSFRow row = sheet.createRow(all.indexOf(c) + 1);
		createRows(c, row);
	}

	private void createRows(Cliente c, XSSFRow row) {
		row.createCell(0).setCellValue(DateUtil.dateToString(c.getFechaRegistro(), DateUtil.FORMATO_UNO));
		row.createCell(1).setCellValue(c.getId().getTipoDocumento());
		row.createCell(2).setCellValue(c.getId().getId());
		row.createCell(3).setCellValue(c.getNombreCompleto());
		row.createCell(4).setCellValue(c.getNombreUno());
		row.createCell(5).setCellValue(c.getNombreDos());
		row.createCell(6).setCellValue(c.getApellidoUno());
		row.createCell(7).setCellValue(c.getApellidoDos());
		row.createCell(8).setCellValue(DateUtil.dateToString(c.getFechaNacimiento(), DateUtil.FORMATO_UNO));
		row.createCell(9).setCellValue(c.getCelular());
		row.createCell(10).setCellValue(c.getCorreo());
	}
	
	
	

}
