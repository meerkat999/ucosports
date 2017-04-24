package co.com.meerkats.ucosports.domain.dto.graphic;

import co.com.meerkats.ucosports.constant.InputConstants;
import co.com.meerkats.ucosports.util.TypeInput;

public class InputForm {

	private String value;
	private TypeInput type;
	private String name;
	private Integer maxValue;
	private String style;
	private String attribute;
	
	private InputForm(TypeInput type, String name,Integer maxValue, String style, String attribute){
		this.type = type;
		this.name = name;
		this.maxValue = maxValue;
		this.style = style;
		this.value = "";
		this.setAttribute(attribute);
	}
		
	public static InputForm CREATE_TEXT(String name, String attribute){
		return new InputForm(TypeInput.TEXT, name, InputConstants.TEXT_MAX_VALUE, InputConstants.TEXT_STYLE, attribute);
	}
	
	public static InputForm CREATE_TEXT(String name, Integer maxValue, String attribute){
		return new InputForm(TypeInput.TEXT, name, maxValue, InputConstants.TEXT_STYLE, attribute);
	}
	
	public static InputForm CREATE_NUMBER(String name, String attribute) {
		return new InputForm(TypeInput.NUMBER, name, InputConstants.NUMBER_MAX_VALUE, InputConstants.NUMBER_STYLE,attribute);
	}
	
	public static InputForm CREATE_NUMBER(String name, Integer maxValue, String attribute) {
		return new InputForm(TypeInput.NUMBER, name, maxValue, InputConstants.NUMBER_STYLE, attribute);
	}
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public TypeInput getType() {
		return type;
	}
	public void setType(TypeInput type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getMaxValue() {
		return maxValue;
	}
	public void setMaxValue(Integer maxValue) {
		this.maxValue = maxValue;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	
}
