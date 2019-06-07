package PWJ.Employee_Manager.model;


import org.springframework.stereotype.Repository;

@Repository
public class ContractTypes {

	private int id;
	private String name;
	private String short_name;
	private String tax;
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShort_name() {
		return short_name;
	}
	public void setShort_name(String short_name) {
		this.short_name = short_name;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	
	
	
}
