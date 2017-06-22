package co.com.meerkats.ucosports.logical.Impl;

import java.util.ArrayList;
import java.util.List;

import co.com.meerkats.ucosports.logical.LogicalCommon;

public abstract class LogicalCommonImpl<X, Y> implements LogicalCommon<X, Y> {

	@Override
	public List<Y> listEntitiesToListDTOs(List<X> listEntities, Boolean herencia) {
		List<Y> listDTOs = new ArrayList<>();
		if(listEntities != null && listEntities.size() > 0){
			listEntities.stream().forEach(s -> {
				listDTOs.add(buildDTO(s, herencia));
			});
		}
		return listDTOs;
	}

	@Override
	public abstract Y buildDTO(X entity, Boolean herencia);

}
