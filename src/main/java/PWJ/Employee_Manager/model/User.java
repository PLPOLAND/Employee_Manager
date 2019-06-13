package PWJ.Employee_Manager.model;

import java.math.BigDecimal;

public class User {

	private int id;
	private String login;
	private String name;
	private String surname;
	private String email;
	private String password;
	private String account_number;
	private BigDecimal gross_salary; // brutto
	private double net_salary; // netto
	private String position; // stanowisko
	private String contract_type;
	private String account_type;

	public int getId() {
		return id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
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

	public String getSurname() {
		return surname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public BigDecimal getGross_salary() {
		return gross_salary;
	}

	public void setGross_salary(double gross_salary, double procent) {
		this.gross_salary = new BigDecimal(gross_salary+ (gross_salary * procent)).setScale(2, BigDecimal.ROUND_DOWN);
	}

	public double getNet_salary() {
		return net_salary;
	}

	public void setNet_salary(double net_salary) {
		this.net_salary = net_salary;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getContract_type() {
		return contract_type;
	}

	public void setContract_type(String contract_type) {
		this.contract_type = contract_type;
	}

	public String getAccount_type() {
		return account_type;
	}

	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}

	
}
