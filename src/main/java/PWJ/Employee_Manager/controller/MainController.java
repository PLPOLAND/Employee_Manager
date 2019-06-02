package PWJ.Employee_Manager.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String loadAddUserPage(HttpServletRequest request) {

		Security sec = new Security(request, userdao);
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				return "addUserPage";
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
	public String editUserPage(@RequestParam("id") int id, HttpServletRequest request,Model model) {
		Security sec = new Security(request, userdao);
		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				List<User> user = userdao.find_user_by_id(id);
				model.addAttribute("user", user);
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
			return "UeditProfilePage";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/editUser")
	public String editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Security sec = new Security(request, userdao);
		PrintWriter out = response.getWriter();

		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {
				int id = Integer.parseInt(request.getParameter("id"));
				String name = request.getParameter("name");
				String surname = request.getParameter("surname");
				String email = request.getParameter("email");
				String account = request.getParameter("account");
				String old_pass = request.getParameter("oldpassword");
				String new_pass = request.getParameter("newpassword");
				
				if(old_pass.equals("")) { // gdy nie zmieniamy hasła
					userdao.editUser_1(id,name,surname,email,account);
				}
				else if(!old_pass.equals("") || !new_pass.equals("")) {
					userdao.editUser_2(id,name,surname,email,account,new_pass);
					
					
					// TODO: sprawdzanie czy stare haslo jest poprawne
					// i wswietlenie komunikatu jesli okaze sie nieprawidlowe
				}
				return "redirect:/ahome";
			}
		} else {
			return "redirect:/";
		}
	}
	@RequestMapping("/APayment")
	public String payment(Model model, HttpServletRequest request){
		Security sec = new Security(request, userdao);

		if (sec.isLoged()) {
			if (!sec.isUserAdmin()) {
				return "redirect:/uhome";
			} else {

				List<Salary> salary = salarydao.getUsersSalary();
				Double totalPayment = salarydao.getTotalPayment();
				model.addAttribute("userSalary", salary);
				model.addAttribute("totalPayment",totalPayment);
				
				return "APaymentHistory";
			}
		} else {
			return "redirect:/";
		}
	}
	
}
