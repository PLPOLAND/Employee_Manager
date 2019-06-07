package PWJ.Employee_Manager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import PWJ.Employee_Manager.model.AccountTypes;


@Repository
public class AccountTypesDAO {

	@Autowired
	private JdbcTemplate jdbc;

	final private String GET_ACCOUNT_TYPES = "SELECT id_t, nazwa FROM typy_konta";

	public List<AccountTypes> getAccountTypes() {
		return this.jdbc.query(GET_ACCOUNT_TYPES, getAccountTypesMap());
	}

	private RowMapper<AccountTypes> getAccountTypesMap() {

		RowMapper<AccountTypes> tmpMap = (rs, rowNum) -> {
			AccountTypes ac = new AccountTypes();

			ac.setId(rs.getInt("id_t"));
			ac.setName(rs.getString("nazwa"));
			return ac;
		};

		return tmpMap;

	}

}
