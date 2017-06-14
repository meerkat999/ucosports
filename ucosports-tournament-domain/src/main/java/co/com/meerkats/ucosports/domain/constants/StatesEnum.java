package co.com.meerkats.ucosports.domain.constants;

public enum StatesEnum {

	ACTIVO("A"), INACTIVO("I");
	
	private String value;
	
	StatesEnum(String a){
		this.value = a;
	}
	
	public String getValue() {
		return value;
	}	
	
}
