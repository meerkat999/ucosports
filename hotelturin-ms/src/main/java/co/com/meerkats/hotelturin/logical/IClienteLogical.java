package co.com.meerkats.hotelturin.logical;

import java.io.File;
import java.util.List;

import co.com.meerkats.hotelturin.domain.Cliente;
import co.com.meerkats.hotelturin.dto.ClienteDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.utils.DateDTO;
import co.com.meerkats.hotelturin.dto.utils.ListDateDTO;

public interface IClienteLogical extends ILogicalCommon<Cliente, ClienteDTO> {

	ClienteDTO getById(ClienteKeyDTO key);
	ClienteDTO add(ClienteDTO cliente) throws Exception;

	ListDateDTO getMonthsWithClients(DateDTO date);

	List<DateDTO> getYearsWithClients();

	File exportAll();
	
	ClienteDTO validarTipoDocumentoYCliente(String cedula, Integer tipodocumentoId) throws Exception;
	Cliente getEntityForOtherEntity(String cedula, Integer tipodocumentoId) throws Exception;
	
}
