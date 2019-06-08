package PWJ.Employee_Manager.dao;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import PWJ.Employee_Manager.model.Salary;

@Repository
public class SalaryDAO {

	@Autowired
	private JdbcTemplate jdbc;

	final String GET_USER_SALARY = "SELECT id_w,wyplaty.id_u,data_wyplaty,kwota_netto, typy_umowy.procent_podatku FROM wyplaty,uzytkownicy,typy_umowy WHERE wyplaty.id_u=uzytkownicy.id_u AND uzytkownicy.id_t=typy_umowy.id_t AND wyplaty.id_u=";
	final String GET_USERS_SALARY = "SELECT * FROM wyplaty NATURAL JOIN uzytkownicy NATURAL JOIN typy_umowy ORDER BY data_wyplaty DESC";
	final String GET_TOTAL_PAYMENT ="SELECT SUM(kwota_netto*(1+procent_podatku)) FROM wyplaty NATURAL JOIN typy_umowy NATURAL JOIN uzytkownicy";
	final String ADD_PAYMENT ="INSERT INTO wyplaty (id_u,data_wyplaty,kwota_netto) VALUES (?,?,?)";
	
	
	public List<Salary> getUserSalary(int id) {

		return this.jdbc.query(GET_USER_SALARY + "\"" + id + "\"", getUserSalaryMap());

	}
	public List<Salary> getUsersSalary() {

		return this.jdbc.query(GET_USERS_SALARY, getUsersSalaryMap());

	}

	public double getTotalPayment() {
		return this.jdbc.queryForObject(GET_TOTAL_PAYMENT, Double.class);
	}
	
	public void addPayment(String id, String date, String ammount) {
		jdbc.update(ADD_PAYMENT, id,date,ammount);
	}
	private RowMapper<Salary> getUserSalaryMap() {

		RowMapper<Salary> tmpMap = (rs, rowNum) -> {
			Salary salary = new Salary();
			salary.setId_s(rs.getInt("id_w"));
			salary.setId_u(rs.getInt("id_u"));
			salary.setPayday(rs.getString("data_wyplaty"));
			salary.setNet_salary(rs.getDouble("kwota_netto"));
			salary.setTax(rs.getDouble("procent_podatku"));
			BigDecimal bd = new BigDecimal(salary.getNet_salary() * (1 + salary.getTax())).setScale(1,BigDecimal.ROUND_HALF_DOWN); // zaokraglenie do 1 miejsca po przecinku
			
			salary.setGross_salary(bd.doubleValue());

			return salary;
		};

		return tmpMap;

	}
	private RowMapper<Salary> getUsersSalaryMap() {

		RowMapper<Salary> tmpMap = (rs, rowNum) -> {
			Salary salary = new Salary();
			salary.setId_s(rs.getInt("id_w"));
			salary.setId_u(rs.getInt("id_u"));
			salary.setPayday(rs.getString("data_wyplaty"));
			salary.setNet_salary(rs.getDouble("kwota_netto"));
			salary.setTax(rs.getDouble("procent_podatku"));
			BigDecimal bd = new BigDecimal(salary.getNet_salary() * (1 + salary.getTax())).setScale(1,BigDecimal.ROUND_HALF_DOWN); // zaokraglenie do 1 miejsca po przecinku
			salary.setGross_salary(bd.doubleValue());
			salary.setUserAccount(rs.getString("nr_konta"));
			salary.setUserContractType(rs.getString("nazwa_skr"));;
			salary.setUserName(rs.getString("imie"));
			salary.setUserSurname(rs.getString("nazwisko"));
			salary.setUserPosition(rs.getString("stanowisko"));
			return salary;
		};

		return tmpMap;

	}
}
