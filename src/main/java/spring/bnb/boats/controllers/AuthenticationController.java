package spring.bnb.boats.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author mapan
 */
@Controller
public class AuthenticationController {

    @GetMapping("/login.html")
    public String showLoginPage() {
        return "login-form";
    }

    @GetMapping("/access-denied")
    public String showAccessDeniedPage() {
        return "access-denied";
    }

}
