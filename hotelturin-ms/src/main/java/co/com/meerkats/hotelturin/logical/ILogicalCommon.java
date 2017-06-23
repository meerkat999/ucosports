package co.com.meerkats.hotelturin.logical;

import java.util.List;

public interface ILogicalCommon<X,Y> {

	List<Y> listEntitiesToListDTOs(List<X> listEntities);
	Y buildDTO(X entity);
	
}
