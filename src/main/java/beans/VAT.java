package beans;

public class VAT {
	private int id;
	private Float value;
	
	public VAT() {
	}
	
	public VAT(Float value) {
		this.value = value;
	}
	
	public VAT(int id, Float value) {
		this.id = id;
		this.value = value;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Float getValue() {
		return value;
	}

	public void setValue(Float value) {
		this.value = value;
	}
}
