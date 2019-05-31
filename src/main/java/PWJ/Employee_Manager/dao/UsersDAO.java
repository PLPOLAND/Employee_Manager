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

	final String GET_ALL_USERS = "SELECT uzytkownicy.id_u, imie, nazwisko, haslo, mail, nr_konta, wyplata_netto, stanowisko, typy_umowy.nazwa_skr, typy_konta.nazwa FROM uzytkownicy LEFT JOIN loginy ON loginy.id_u = uzytkownicy.id_u LEFT JOIN typy_umowy ON uzytkownicy.id_t=typy_umowy.id_t LEFT JOIN typy_konta ON uzytkownicy.id_tk = typy_konta.id_t ";
	final String SET_USER = "INSERT INTO uzytk (imie,nazwisko) VALUES (?,?)"; // niedokonczone
	final String FIND_USER_LOGIN = " SELECT uzytkownicy.id_u, uzytkownicy.imie, uzytkownicy.nazwisko, typy_konta.nazwa FROM uzytkownicy NATURAL JOIN loginy LEFT JOIN typy_konta ON typy_konta.id_t = uzytkownicy.id_tk ";
	final String DELETE_USER_1 = "DELETE FROM loginy WHERE id_u=?"; // usuwamy z 1 tabeli
	final String DELETE_USER_2 = "DELETE FROM uzytkownicy WHERE id_u=?"; // usuwamy z 2 tabeli
	final String EDIT_USER_1 = "UPDATE uzytkownicy SET imie=?,nazwisko=?,mail=?,nr_konta=? WHERE id_u=?"; 																								// hasla
	final String EDIT_USER_2 = "UPDATE loginy SET haslo=? WHERE id_u=?"; 
	public List<User> findAll() {

		return this.jdbc.query(GET_ALL_USERS, getMap());

	}

	public List<User> find_to_login(String warunek) {
		return this.jdbc.query(FIND_USER_LOGIN + " WHERE " + warunek, getLoginMap());
		// return this.jdbc.query("SELECT * FROM uzytkownicy, loginy WHERE loginy.haslo
		// = \"MareczekP\" AND login = \"MarekP\" AND loginy.id_u=uzytkownicy.id_u" ,
		// getLoginMap());
	}

	public List<User> find_user_by_id(Integer id) {
		return this.jdbc.query(GET_ALL_USERS + " WHERE uzytkownicy.id_u = \"" + id + "\"", getMap());
	}

	public void addUser(String name, String surname) { // niedokonczone
		jdbc.update(SET_USER, name, surname);
	}

	public void deleteUser(int id) {
		jdbc.update(DELETE_USER_1, id);
		jdbc.update(DELETE_USER_2, id);
	}

	public void editUser_1(int id, String name, String surname, String email, String account) {
		jdbc.update(EDIT_USER_1, name, surname, email, account, id);
	}
	
	public void editUser_2(int id, String name, String surname, String email, String account, String password) {
		jdbc.update(EDIT_USER_2, password,id);
		jdbc.update(EDIT_USER_1, name, surname, email, account, id);
		
		
	}

	private RowMapper<User> getLoginMap() {
		RowMapper<User> tmpMap = (rs, rowNum) -> {
			User user = new User();
			user.setId(rs.getInt("id_u"));
			user.setName(rs.getString("imie"));
			user.setSurname(rs.getString("nazwisko"));
			user.setAccount_type(rs.getString("nazwa"));
			return user;
		};
		return tmpMap;
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
