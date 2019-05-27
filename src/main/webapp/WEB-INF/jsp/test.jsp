
<!-- Nie przejmujcie sie tym, wrzucilem sobie taki pliczek testowy zebym mogl na drugim kompie pracowac -->



<%-- package PWJ.Employee_Manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import PWJ.Employee_Manager.dao.UsersDAO;
import PWJ.Employee_Manager.model.User;

@Controller
public class MainController {

	@Autowired
	UsersDAO userdao;

	@RequestMapping("/")
	public String loadLoginPage() {
		return "loginPage";
	}

	@RequestMapping("/home")
	public String loadMainPage(Model model) {

		List<User> userList = userdao.findAll();
		model.addAttribute("userList", userList);

		return "homePage";
	}
	
	
	
	/* Obszar testowy do usuwania/edytowania/dodawania uzytkownikow */
	

	@RequestMapping(value = "/test")
	public String test(@RequestParam("id") int id, Model model) {
		List<User> userList = userdao.find_to_login("uzytkownicy.id_u="+id);
		model.addAttribute("userList",userList);
		return "test";
		
	}
}


///////////


<c:forEach var="userval" items="${userList}">
				<div class="user-line">
					<div class="user-pole"> ${userval.getName()}</div>
					<div class="user-pole"> ${userval.getSurname()}</div>
					<div class="user-pole"> ${userval.getEmail()}</div>
					<div class="user-pole"> ${userval.getAccount_number()}</div>
					<div class="user-pole"> ${userval.getNet_salary()}</div>
					<div class="user-pole"> ${userval.getGross_salary()}</div>
					<div class="user-pole"> ${userval.getPosition()}</div>
					<div class="user-pole"> ${userval.getContract_type()}</div>
					<div class="user-pole">					
						<input type="submit" class="" value="Edytuj" onclick="location.href='/test?id=<c:out value='${userval.getId()}' />'"/>
					</div>
				</div>
			</c:forEach>
 --%>