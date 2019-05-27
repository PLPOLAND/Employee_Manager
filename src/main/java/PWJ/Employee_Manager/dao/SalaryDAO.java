package PWJ.Employee_Manager.dao;

import java.math.BigDecimal;
import java.text.DecimalFormat;
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

	public List<Salary> getUserSalary(int id) {

		return this.jdbc.query(GET_USER_SALARY + "\"" + id + "\"", getUserSalaryMap());

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
}
