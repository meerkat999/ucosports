package co.com.meerkats.ucosports.logical;

import java.util.List;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.dto.SportDTO;

public interface ISportLogical extends LogicalCommon<Sport, SportDTO> {

	Sport save(Sport sport);
	Sport saveDTO(SportDTO sportDTO);
	Sport updateDTO(SportDTO sportDTO);
	List<Sport> findAll();
	List<SportDTO> findAllDTO();

}
