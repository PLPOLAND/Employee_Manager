package PWJ.Employee_Manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import PWJ.Employee_Manager.dao.UsersDAO;
import PWJ.Employee_Manager.model.User;
import PWJ.Employee_Manager.security.Security;

@Controller
public class MainController {

	@Autowired
	UsersDAO userdao;

	@RequestMapping("/")
	public String loadLoginPage() {
		return "loginPage";
	}
	
	@RequestMapping("/paymenthistory")
	public String loadPaymentHistoryPage() {
		return "paymentHistoryPage";
	}
	
	@RequestMapping("/myaccount")
	public String loadMyAccountPage() {
		return "myAccountPage";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request)
	{
		Security security = new Security(request, userdao);

		if (security.login()) {
			return "redirect:/uhome";
		} else {
			return "redirect:/bad_login";
		}
	}

	@RequestMapping("/bad_login")
	public String bad_login(){
		return "loginPage";
	}


	@RequestMapping("/uhome")
	public String loadMainPage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			List<User> userList = userdao.findAll();
			model.addAttribute("userList", userList);

			return "userHomePage";
		} else {
			return "redirect:/";
		}
		
	}
}
