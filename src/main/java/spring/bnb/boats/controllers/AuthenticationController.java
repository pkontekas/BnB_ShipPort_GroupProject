package spring.bnb.boats.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author mapan
 */
@Controller
public class AuthenticationController {
    
    @GetMapping("/loginPage")
    public String showLoginPage(){
        return "login-form";
    }
}
