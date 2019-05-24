package PWJ.Employee_Manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
