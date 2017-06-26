package co.com.meerkats.hotelturin.domain.constants;

public enum StatesEnum {

	ACTIVO(1), INACTIVO(2), OCUPADA(3);
	
	private Integer value;
	
	StatesEnum(Integer a){
		this.value = a;
	}
	
	public Integer getValue() {
		return value;
	}	
	
}
