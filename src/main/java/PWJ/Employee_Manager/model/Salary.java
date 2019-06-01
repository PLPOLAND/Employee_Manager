package PWJ.Employee_Manager.model;

public class Salary {

	private int id_s;
	private int id_u;
	private String payday;
	private double net_salary;
	private double gross_salary;
	private double tax; // w zaleznosci od typu umowy
	
	private User user;

	public Salary(){
		user = new User();
	}
	public void setUserAccount(String account_number){
		user.setAccount_number(account_number);
	}
	public void setUserContractType(String contract_type){
		user.setContract_type(contract_type);
	}
	public User getUserData(){
		return user;
	}
	
	public int getId_s() {
		return id_s;
	}
	public void setId_s(int id_s) {
		this.id_s = id_s;
	}
	public int getId_u() {
		return id_u;
	}
	public void setId_u(int id_u) {
		this.id_u = id_u;
	}
	public String getPayday() {
		return payday;
	}
	public void setPayday(String payday) {
		this.payday = payday;
	}
	public double getNet_salary() {
		return net_salary;
	}
	public void setNet_salary(double net_salary) {
		this.net_salary = net_salary;
	}
	public double getGross_salary() {
		return gross_salary;
	}
	public void setGross_salary(double gross_salary) {
		this.gross_salary = gross_salary;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	
	
	
}
