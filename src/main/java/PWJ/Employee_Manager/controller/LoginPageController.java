package PWJ.Employee_Manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginPageController {

	@RequestMapping("/")
	public String loadLoginPage() {
		return "loginPage";
	}
}
