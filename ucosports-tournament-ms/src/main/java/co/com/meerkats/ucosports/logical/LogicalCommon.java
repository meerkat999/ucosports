package co.com.meerkats.ucosports.logical;

import java.util.List;

public interface LogicalCommon<X,Y> {

	List<Y> listEntitiesToListDTOs(List<X> listEntities, Boolean herencia);
	Y buildDTO(X entity, Boolean herencia);
	
}
