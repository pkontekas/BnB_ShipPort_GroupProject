package spring.bnb.boats.controllers;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import spring.bnb.boats.services.AccountService;

/**
 * @author pkontekas
 */
@Controller
public class MyProfileController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/preupdateaccount")
    public String showUserPreUpdateForm(ModelMap mm,
            @ModelAttribute("passerror") String error,
            Principal principal) {

        String accountEmail = principal.getName();
        mm.addAttribute("oldaccount", accountService.getAccountByEmail(accountEmail));
        mm.addAttribute("passerror", error);
        return "profile";
    }
}
