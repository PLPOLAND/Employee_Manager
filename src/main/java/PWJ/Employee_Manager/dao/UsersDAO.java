package PWJ.Employee_Manager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import PWJ.Employee_Manager.model.User;

@Repository
public class UsersDAO {

	@Autowired
	private JdbcTemplate jdbc;

	final String GET_ALL_USERS = "SELECT id_u, imie, nazwisko, haslo, mail, nr_konta, wyplata_netto, stanowisko, typy_umowy.nazwa_skr, typy_konta.nazwa FROM uzytkownicy LEFT JOIN typy_umowy ON uzytkownicy.id_tu=typy_umowy.id_t LEFT JOIN typy_konta ON uzytkownicy.id_tk = typy_konta.id_t "; 
	final String SET_USER = "INSERT INTO uzytk (imie,nazwisko) VALUES (?,?)"; // niedokonczone

	public List<User> findAll() {

		return this.jdbc.query(GET_ALL_USERS, getMap());

	}

	public void addUser(String name, String surname) { // niedokonczone
		jdbc.update(SET_USER, name, surname);
	}

	private RowMapper<User> getMap() {
		RowMapper<User> empMap = (rs, rowNum) -> {
			User user = new User();
			user.setId(rs.getInt("id_u"));
			user.setName(rs.getString("imie"));
			user.setSurname(rs.getString("nazwisko"));
			user.setPassword(rs.getString("haslo"));
			user.setEmail(rs.getString("mail"));
			user.setAccount_number(rs.getString("nr_konta"));
			user.setNet_salary(rs.getDouble("wyplata_netto"));
			user.setGross_salary(rs.getDouble("wyplata_netto") * 1.18); // 18% podatku?
			user.setPosition(rs.getString("stanowisko"));
			user.setContract_type(rs.getString("nazwa_skr"));
			user.setAccount_type(rs.getString("nazwa"));
			
			return user;
		};
		return empMap;
	}

	// https://www.mkyong.com/spring/spring-jdbctemplate-querying-examples/
	// https://www.mkyong.com/spring-boot/spring-boot-jdbc-mysql-hikaricp-example/
	// https://www.codejava.net/coding/jsp-servlet-jdbc-mysql-create-read-update-delete-crud-example

}