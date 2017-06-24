package co.com.meerkats.hotelturin.logical.Impl;

import java.util.ArrayList;
import java.util.List;

import co.com.meerkats.hotelturin.logical.ILogicalCommon;

public abstract class LogicalCommonImpl<X, Y> implements ILogicalCommon<X, Y> {

	
	@Override
	public List<Y> listEntitiesToListDTOs(List<X> listEntities) {
		List<Y> listDTOs = new ArrayList<>();
		if(listEntities != null && listEntities.size() > 0){
			listEntities.stream().forEach(s -> {
				listDTOs.add(buildDTO(s));
			});
		}
		return listDTOs;
	}

	@Override
	public abstract Y buildDTO(X entity);

}
