package PWJ.Employee_Manager.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import PWJ.Employee_Manager.dao.UsersDAO;
import PWJ.Employee_Manager.model.User;

@Repository
public class security{
    @Autowired
    UsersDAO database;

    boolean is_loged;
    String login;

    public void login(HttpServletRequest request) {
        String pass;

        login = request.getParameter("login");
        pass=request.getParameter("pass");
        
        if (login.isEmpty()) {
            return ; //TODO
        }
        
        //TODO: hashThePass

        List<User> resultUsers = database.find_to_login("haslo = " + pass + " AND  login = " + login);

        //TODO:
    }


    public boolean isLoged() {
        
        return true;
    }


}