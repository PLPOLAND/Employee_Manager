package PWJ.Employee_Manager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import PWJ.Employee_Manager.model.ContractTypes;

@Repository
public class ContractTypesDAO {

	@Autowired
	private JdbcTemplate jdbc;

	final private String GET_CONTRACT_TYPES = "SELECT id_t, nazwa, nazwa_skr, procent_podatku FROM typy_umowy";

	public List<ContractTypes> getContractTypes() {
		return this.jdbc.query(GET_CONTRACT_TYPES, getContractTypesMap());
	}

	private RowMapper<ContractTypes> getContractTypesMap() {

		RowMapper<ContractTypes> tmpMap = (rs, rowNum) -> {
			ContractTypes ct = new ContractTypes();

			ct.setId(rs.getInt("id_t"));
			ct.setName(rs.getString("nazwa"));
			ct.setShort_name(rs.getString("nazwa_skr"));
			ct.setTax(rs.getString("procent_podatku"));
			return ct;
		};

		return tmpMap;

	}
}
