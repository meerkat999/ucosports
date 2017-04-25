package co.com.meerkats.ucosports.logical;

import co.com.meerkats.ucosports.domain.Sport;
import co.com.meerkats.ucosports.domain.dto.SportDTO;

public interface ISportLogical {

	Sport save(Sport sport);
	Sport saveDTO(SportDTO sportDTO);

}
