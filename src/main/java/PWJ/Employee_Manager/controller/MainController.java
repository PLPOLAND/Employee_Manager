package PWJ.Employee_Manager.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PWJ.Employee_Manager.dao.AccountTypesDAO;
import PWJ.Employee_Manager.dao.ContractTypesDAO;
import PWJ.Employee_Manager.dao.SalaryDAO;
import PWJ.Employee_Manager.dao.UsersDAO;
import PWJ.Employee_Manager.model.AccountTypes;
import PWJ.Employee_Manager.model.ContractTypes;
import PWJ.Employee_Manager.model.Salary;
import PWJ.Employee_Manager.model.User;
import PWJ.Employee_Manager.security.Encryption;
import PWJ.Employee_Manager.security.Security;

@Controller
public class MainController {

	@Autowired
	UsersDAO userdao;
	@Autowired
	SalaryDAO salarydao;
	@Autowired
	AccountTypesDAO acdao;
	@Autowired
	ContractTypesDAO ctdao;

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
			return "redirect:/uhome"; // tu zmiana Ady!!!!!
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
				model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
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
			model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
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
			model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
			return "myAccountPage";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/contact")
	public String loadContactPage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);
		model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
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
	public String loadAddUserPage(HttpServletRequest request, Model model) {

		Security sec = new Security(request, userdao);
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				List<AccountTypes> ac = acdao.getAccountTypes();
				List<ContractTypes> ct = ctdao.getContractTypes();
				model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
				model.addAttribute("accountTypes", ac);
				model.addAttribute("contractTypes", ct);
				return "addUserPage";
			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/addU")
	public String addUser(HttpServletRequest request) {
		Security sec = new Security(request, userdao);
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				User newuser = new User();
				AccountTypes ac = new AccountTypes();
				ContractTypes ct = new ContractTypes();
				Encryption ec = new Encryption();
				newuser.setLogin(request.getParameter("login"));
				newuser.setName(request.getParameter("name"));
				newuser.setSurname(request.getParameter("surname"));
				newuser.setEmail(request.getParameter("mail"));
				newuser.setAccount_number(request.getParameter("account"));
				newuser.setPassword(ec.encryptPassword(request.getParameter("password")));
				newuser.setNet_salary(Double.parseDouble(request.getParameter("net_salary")));
				newuser.setPosition(request.getParameter("position"));
				ac.setId(Integer.parseInt(request.getParameter("account_type")));
				ct.setId(Integer.parseInt(request.getParameter("contract_type")));
				userdao.addUser(newuser, ct, ac);
				return "redirect:/ahome";
			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/delete")
	public String deleteUser(@RequestParam("id") int id, HttpServletRequest request) {
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

	@RequestMapping(value = "/edit")
	public String editUserPage(@RequestParam("id") int id, HttpServletRequest request, Model model) {
		Security sec = new Security(request, userdao);
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				List<User> user = userdao.find_user_by_id(id);
				model.addAttribute("user", user);
				model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
				return "editUserPage";

			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/Uedit")
	public String UeditProfilePage(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			List<User> user = userdao.find_user_by_id(sec.getUserID());
			model.addAttribute("user", user);
			model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
			return "UeditProfilePage";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/editUser")
	public String editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Security sec = new Security(request, userdao);
		Encryption ec = new Encryption();
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				int id = Integer.parseInt(request.getParameter("id"));
				String name = request.getParameter("name");
				String login = request.getParameter("login");
				String surname = request.getParameter("surname");
				String email = request.getParameter("mail");
				String account = request.getParameter("account");
				String pass = ec.encryptPassword(request.getParameter("password"));
				String payment = request.getParameter("net_salary");
				String position = request.getParameter("position");

				if (pass.equals("")) { // gdy nie zmieniamy hasła
					userdao.editUser_1(id, name, login,surname, email, account, payment, position);
				} else if (!pass.equals("")){
					userdao.editUser_2(id, name, login, surname, email, account, pass, payment, position);
				}
				return "redirect:/ahome";
			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/APayment")
	public String payment(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {

				List<Salary> salary = salarydao.getUsersSalary();
				BigDecimal bd = new BigDecimal(salarydao.getTotalPayment()).setScale(1,BigDecimal.ROUND_HALF_DOWN);
				model.addAttribute("userSalary", salary);
				model.addAttribute("totalPayment", bd.doubleValue());
				model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());

				return "APaymentHistory";
			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/AddPay")
	public String adding_pay_form(Model model, HttpServletRequest request) {
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				List<User> userList = userdao.findAll();
				model.addAttribute("userName", sec.getUserName() + " " + sec.getUserSurName());
				model.addAttribute("userList", userList);
				return "AddPay";
			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/AddP")
	public String adding_pay(HttpServletRequest request) {
		Security sec = new Security(request, userdao);
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				String id = request.getParameter("userID");
				String date = request.getParameter("date");
				String ammount = request.getParameter("ammount");
				salarydao.addPayment(id, date, ammount);
				return "redirect:/ahome";
			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		Security sec = new Security(request, userdao);
		sec.logout();
		return "redirect:/";
	}

}
