package PWJ.Employee_Manager.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

@RestController
public class DatabaseTest {
	@Autowired  
    JdbcTemplate jdbc;    
    @RequestMapping("/insert")  
    public String index(){  
        jdbc.execute("insert into uzytk(imie,nazwisko)values('ada','tralala')");  
        return"data inserted Successfully";  
    }  
	
}
