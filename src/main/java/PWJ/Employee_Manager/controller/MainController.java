package PWJ.Employee_Manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import PWJ.Employee_Manager.dao.SalaryDAO;
import PWJ.Employee_Manager.dao.UsersDAO;
import PWJ.Employee_Manager.model.Salary;
import PWJ.Employee_Manager.model.User;
import PWJ.Employee_Manager.security.Security;

@Controller
public class MainController {

	@Autowired
	UsersDAO userdao;
	@Autowired
	SalaryDAO salarydao;

	@RequestMapping("/")
	public String loadLoginPage() {
		return "loginPage";
	}

	@RequestMapping("/paymenthistory")
	public String loadPaymentHistoryPage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			List<Salary> salary = salarydao.getUserSalary(sec.getUserID());
			List<User> user = userdao.find_user_by_id(sec.getUserID());
			model.addAttribute("user", user);
			model.addAttribute("userSalary", salary);
			return "paymentHistoryPage";
		} else {
			return "redirect:/";
		}

	}

	@RequestMapping("/myaccount")
	public String loadMyAccountPage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			List<User> user = userdao.find_user_by_id(sec.getUserID());
			model.addAttribute("user", user);
			return "myAccountPage";
		} else {
			return "redirect:/";
		}

	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		Security security = new Security(request, userdao);

		if (security.login()) {
			return "redirect:/uhome";
		} else {
			return "redirect:/bad_login";
		}
	}

	@RequestMapping("/bad_login")
	public String bad_login() {
		return "loginPage";
	}

	@RequestMapping("/uhome")
	public String loadMainPage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			if(!sec.isUserAdmin()){//jeśli użytkownik nie jest adminem to przekieruj go gdzieś
				
				return "redirect:/myaccount";
			}
			else{
				List<User> userList = userdao.findAll();
				model.addAttribute("userList", userList);

				return "userHomePage";
			}
		} else {
			return "redirect:/";
		}

	}
	
	@RequestMapping("/contact")
	public String loadContactPage() {
		return "contactPage";
	}
	
	@RequestMapping("/testtest")
	public String loadTestPage() {
		return "testtest";
	}
}
