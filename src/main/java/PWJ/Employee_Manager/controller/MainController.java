package PWJ.Employee_Manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		Security security = new Security(request, userdao);

		if (security.login()) {
			if (security.isUserAdmin()) {
				return "redirect:/ahome";
			}
			return "userHomePage";
		} else {
			return "redirect:/bad_login";
		}
	}

	@RequestMapping("/bad_login")
	public String bad_login() {
		return "badLoginPage";
	}

	@RequestMapping("/uhome")
	public String loadMainPage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {// jeśli użytkownik nie jest adminem to przekieruj go gdzieś

				List<User> userList = userdao.findAll();
				model.addAttribute("userList", userList);
				return "userHomePage";
			} else {
				return "redirect:/ahome";
			}

		} else {
			return "redirect:/";
		}

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

	@RequestMapping("/contact")
	public String loadContactPage() {
		return "contactPage";
	}

	@RequestMapping("/ahome")
	public String loadAdminPage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {// jeśli użytkonik nie jest adminem to przekieruj go gdzieś

				return "redirect:/uhome";
			} else {
				List<User> userList = userdao.findAll();
				model.addAttribute("userList", userList);
				model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
				return "adminHomePage";
			}
		} else {
			return "redirect:/";
		}

	}

	@RequestMapping("/users")
	public String loadUsersAccountsPage() {
		return "usersAccountsPage";
	}

	@RequestMapping("/adduser")
	public String loadAddUserPage() {
		return "addUserPage";
	}

	@RequestMapping(value = "/delete")
	public String test(@RequestParam("id") int id, HttpServletRequest request) {
		Security sec = new Security(request, userdao);
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				userdao.deleteUser(id);
				return "redirect:/ahome";
			}
		} else {
			return "redirect:/";
		}
	}
	// commit dla ady
}
