package PWJ.Employee_Manager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import PWJ.Employee_Manager.model.AccountTypes;
import PWJ.Employee_Manager.model.ContractTypes;
import PWJ.Employee_Manager.model.User;

@Repository
public class UsersDAO {

	@Autowired
	private JdbcTemplate jdbc;

	final String GET_ALL_USERS = "SELECT loginy.login, uzytkownicy.id_u, imie, nazwisko, haslo, mail, nr_konta, wyplata_netto, stanowisko, typy_umowy.nazwa_skr, typy_umowy.procent_podatku, typy_konta.nazwa FROM uzytkownicy LEFT JOIN loginy ON loginy.id_u = uzytkownicy.id_u LEFT JOIN typy_umowy ON uzytkownicy.id_t=typy_umowy.id_t LEFT JOIN typy_konta ON uzytkownicy.id_tk = typy_konta.id_t";
	final String FIND_USER_LOGIN = " SELECT uzytkownicy.id_u, uzytkownicy.imie, uzytkownicy.nazwisko, typy_konta.nazwa FROM uzytkownicy NATURAL JOIN loginy LEFT JOIN typy_konta ON typy_konta.id_t = uzytkownicy.id_tk ";
	final String DELETE_USER_1 = "DELETE FROM loginy WHERE id_u=?"; // usuwamy z loginow
	final String DELETE_USER_2 = "DELETE FROM uzytkownicy WHERE id_u=?"; // usuwamy z uzytkownikow
	final String DELETE_USER_3 = "DELETE FROM wyplaty WHERE id_u=?"; // usuwamy z wyplat
	final String EDIT_USER_1 = "UPDATE uzytkownicy SET imie=?,nazwisko=?,mail=?,nr_konta=?, wyplata_netto=?, stanowisko=?, id_t=?, id_tk=? WHERE id_u=?"; // hasla
	final String EDIT_USER_2 = "UPDATE loginy SET haslo=?, login=? WHERE id_u=?";
	final String EDIT_USER_3 = "UPDATE loginy SET login=? WHERE id_u=?";
	final String EDIT_USER_4 = "UPDATE loginy SET haslo=? WHERE id_u=?";
	final String EDIT_USER_5 = "UPDATE uzytkownicy SET imie=?,nazwisko=?,mail=?,nr_konta=? WHERE id_u=?";
	final String GET_ACCOUNT_TYPE_ID = "SELECT id_t FROM typy_konta WHERE nazwa=";
	final String GET_CONTRACT_TYPE_ID = "SELECT id_t FROM typy_umowy WHERE nazwa_skr=";
	final String GET_USER_ID = "SELECT id_u FROM uzytkownicy WHERE imie=? AND nazwisko=? AND  mail=? AND nr_konta=?";
	final String ADD_USER_1 = "INSERT INTO uzytkownicy (imie,nazwisko,mail,nr_konta,wyplata_netto,stanowisko,id_t,id_tk) VALUES (?,?,?,?,?,?,?,?)"; // do
																																					// tabeli
																																					// uzytkownicy
	final String ADD_USER_2 = "INSERT INTO loginy (id_u,login,haslo) VALUES(?,?,?)"; // do tabeli loginy

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

	public void addUser(User us, ContractTypes ct, AccountTypes at) {
		jdbc.update(ADD_USER_1, us.getName(), us.getSurname(), us.getEmail(), us.getAccount_number(),
				us.getNet_salary(), us.getPosition(), ct.getId(), at.getId());
		int new_user_id = jdbc.queryForObject(GET_USER_ID, Integer.class, us.getName(), us.getSurname(), us.getEmail(),
				us.getAccount_number());
		jdbc.update(ADD_USER_2, new_user_id, us.getLogin(), us.getPassword());
	}

	public void deleteUser(int id) {
		jdbc.update(DELETE_USER_3, id);
		jdbc.update(DELETE_USER_1, id);
		jdbc.update(DELETE_USER_2, id);

	}

	public void editUser_1(int id, String name, String login, String surname, String email, String account,
			String payment, String position, int at, int ct) {
		jdbc.update(EDIT_USER_1, name, surname, email, account, payment, position, ct, at,id);
		jdbc.update(EDIT_USER_3, login, id);
	}

	public void editUser_2(int id, String name, String login, String surname, String email, String account,
			String password, String payment, String position,int at, int ct) {
		jdbc.update(EDIT_USER_2, password, login, id);
		jdbc.update(EDIT_USER_1, name, surname, email, account, payment, position, ct,at,id);
	}

	public void editUser_3(int id, String name, String surname, String email, String account) {
		jdbc.update(EDIT_USER_5, name, surname, email, account, id);
	}

	public void editUser_4(int id, String name, String surname, String email, String account, String password) {
		jdbc.update(EDIT_USER_5, name, surname, email, account, id);
		jdbc.update(EDIT_USER_4,password,id);
	}

	public int get_contract_type_id(String type) {
		return this.jdbc.queryForObject(GET_CONTRACT_TYPE_ID + "\"" + type + "\"", Integer.class);
	}

	public int get_account_type_id(String type) {
		return this.jdbc.queryForObject(GET_ACCOUNT_TYPE_ID + "\"" + type + "\"", Integer.class);
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
			user.setLogin(rs.getString("login"));
			user.setId(rs.getInt("id_u"));
			user.setName(rs.getString("imie"));
			user.setSurname(rs.getString("nazwisko"));
			user.setPassword(rs.getString("haslo"));
			user.setEmail(rs.getString("mail"));
			user.setAccount_number(rs.getString("nr_konta"));
			user.setNet_salary(rs.getDouble("wyplata_netto"));
			user.setGross_salary(rs.getDouble("wyplata_netto"), rs.getDouble("procent_podatku")); // 18% podatku?
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
