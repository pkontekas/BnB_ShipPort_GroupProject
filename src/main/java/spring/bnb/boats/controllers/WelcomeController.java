package spring.bnb.boats.controllers;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.services.AccountService;

@Controller
public class WelcomeController {
    
    @Autowired
    AccountService accountService;

    @RequestMapping("/")
    public String welcome() {
        return "index";
    }

    @RequestMapping("/contactus")
    public String contactus() {
        return "contact-us";
    }

    @RequestMapping("/aboutus")
    public String aboutus() {
        return "about";
    }
    
    @RequestMapping("/chatpage")
    public String showChat(ModelMap mm,Principal principal) {
        String accountEmail = principal.getName();
        Account account = accountService.getAccountByEmail(accountEmail);
        mm.addAttribute("username", account.getSurname());
        return "chat";
    }

}
