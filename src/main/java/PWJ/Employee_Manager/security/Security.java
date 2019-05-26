package PWJ.Employee_Manager.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import PWJ.Employee_Manager.dao.UsersDAO;
import PWJ.Employee_Manager.model.User;

/**
 * Klasa odpowiedzialna za logowanie użytkownika, sprawdzanie czy już się zalogował, oraz pobierania danych zalogowanego użytkownika.
 * @author Marek Pałdyna
 * @version 1.0
 */
@Repository
public class Security{
    @Autowired
    UsersDAO database;

    HttpServletRequest request;

    /**
     * Konstruktor
     * Inicjuje Klasę do działania
     * @param req - typu HttpServletRequest - request ze strony
     * @param dat - typu UsersDAO - instancja klasy do połączeń z bazą danych
     */
    public Security(HttpServletRequest req, UsersDAO dat){
        request = req;
        database = dat;
    }
    
    /**
     * Loguje użytkownika. Pobiera dane przesłane przez protokół POST Potrzebuje
     * conajmniej danej "login"
     * 
     * @version 1.0
     * @return true jeśli logowanie się powiodło
     */
    public boolean login() {
        String login;
        String pass;

        login = request.getParameter("login").toString();
        pass = request.getParameter("pass").toString();
        
        if (login == null || login.isEmpty()) {
            return false; 
        }
        
        //TODO: hashThePass

        
        // database.find_to_login("loginy.haslo = \"" + pass + "\" AND  login = \"" + login + "\"");
        String warunek = "loginy.haslo = \"" + pass + "\" AND  login = \"" + login + "\"";
        List<User> resultUsers = database.find_to_login(warunek);
        // List<User> resultUsers = database.find_user_by_id(1);
        
        if (resultUsers.isEmpty()) {
            return false;
        }
        else{

            String user = resultUsers.get(0).getName();
            String srUser = resultUsers.get(0).getSurname();
            Integer idUser = resultUsers.get(0).getId();
            HttpSession session = request.getSession();
            session.setAttribute("name", user); //dodawanie pola do sesji
            session.setAttribute("surName", srUser);
            session.setAttribute("id", idUser);
            session.setMaxInactiveInterval(60 * 60); //usuniecie pol sesji po 60 minutach
            
            return true;
        }
        
    }

    /**
     * 
     * Funkcja sprawdzająca czy użytkownik jest zalogowany
     * 
     * 
     * @version 1.0
     * @return true - jeśli uzytkownik jest zalogowany
     */
    public boolean isLoged() {
        HttpSession session = request.getSession();

        if(session.getAttribute("name") == null || session.getAttribute("surName") == null || session.getAttribute("id") == null){
            return false;
        }
        else{
            return true;
        }
    }
    /**
     * Funkcja zwracająca Imię użytkownika pobieraną z danych sesji
     * 
     * @version 1.0
     * @return  Nazwe użytkownika
     */
    public String getUserName() {
        if (isLoged()) {
            HttpSession session = request.getSession();
            return session.getAttribute("name").toString();
        }
        else 
        return null;
    }
    /**
     * Funkcja zwracająca ID użytkonika pobierany z danych sesji
     * @version 1.0
     * @return Integer ID użytkownika
     */
    public Integer getUserID() {
        if (isLoged()) {
            HttpSession session = request.getSession();
            return (Integer)session.getAttribute("id");
        } else {
            return null;
        }
    }
    
    /**
     * Funckja zwracająca Nazwisko użytkownika z danych sesji     * 
     * @version 1.0
     * @return Nazwisko
     */
    public String getUserSurName() {
        if (isLoged()) {
            HttpSession session = request.getSession();
            return session.getAttribute("surName").toString();
        } else {
            return null;
        }
    }
    /**
     * Funkcja pobierająca dane użytkonika z bazy danych na podstawie ID (pobranego z danych sesji)
     * @version 1.0
     * @return Dane zalogowanego użytkownika
     */
    public User getFullUserData(){
        if (isLoged()){
            HttpSession session = request.getSession();
            List<User> result = database.find_user_by_id((Integer)session.getAttribute("id"));
            if (result.isEmpty()) {
                return null;
            } else {
                return result.get(0);
            }
        }
        else{
            return null;
        }
    }

}