package co.com.meerkats.hotelturin.logical;

import java.io.File;
import java.util.List;

import co.com.meerkats.hotelturin.domain.Arriendo;
import co.com.meerkats.hotelturin.dto.ArriendoDTO;
import co.com.meerkats.hotelturin.dto.ClienteKeyDTO;
import co.com.meerkats.hotelturin.dto.ListArriendoDTO;

public interface IArriendoLogical extends ILogicalCommon<Arriendo, ArriendoDTO> {

	ArriendoDTO getById(ArriendoDTO arriendoDTO);
	ArriendoDTO add(ArriendoDTO arriendoDTO) throws Exception;
	ArriendoDTO getByClienteKeyCheckInActive(ClienteKeyDTO clienteKeyDTO) throws Exception;
	ListArriendoDTO getByState(ArriendoDTO arriendoDTO);
	ArriendoDTO checkOut(ArriendoDTO arriendoDTO) throws Exception;
	File exportAll();
	ArriendoDTO addNumAcompanantes(ArriendoDTO arriendoDTO, Integer more) throws Exception;
	List<ArriendoDTO> findByArriendosConCapacidadEnHabitacion();
	Arriendo getEntityForOtherEntity(Integer integer) throws Exception;
	List<ArriendoDTO> getByStateAndNoHaveFactura();

}
