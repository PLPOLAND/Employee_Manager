package PWJ.Employee_Manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PWJ.Employee_Manager.dao.UsersDAO;
import PWJ.Employee_Manager.model.User;


@RestController
public class SesionTest {

    @Autowired
        UsersDAO users;

    // wskazanie pod jakim adresem dostępna jest metoda
    @RequestMapping("/login")
    public String doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get request parameters for userID and password
        String user = request.getParameter("login");

        HttpSession session = request.getSession();
        session.setAttribute("user", user); //dodawanie pola do sesji
        session.setMaxInactiveInterval(30 * 60); //usuniecie pol sesji po 30 minutach

        Cookie userName = new Cookie("user", user);//stworzenie nowego ciasteczka o nazwie user i wartości stringu user
        userName.setMaxAge(30 * 60);//ustawienie czasu wygaśniecia ciasteczka
        response.addCookie(userName);//dodanie ciasteczka do odpowiedzi
        List<User> wynik = users.find_to_login("id_u = 2;");
        if(wynik.isEmpty()){
            //TODO
            return "Brak takiego";
        }
        else{
            session.setAttribute("test", wynik.get(0).getName());
        }
        return session.getAttribute("test").toString() + " " + request.getParameter("login");
    }
}