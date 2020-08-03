package spring.bnb.boats.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.models.Role;
import spring.bnb.boats.services.AccountService;

/**
 * @author pkontekas
 */
@Controller
public class RegistrationController {

    @Autowired
    AccountService accountService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/preregisteraccount")
    public String showRegisterForm(ModelMap mm) {
        mm.addAttribute("newaccount", new Account());
        return "registration";
    }

    @PostMapping("/doinsertaccount")
    public String insertAccount(
            @ModelAttribute("newaccount") Account acc,
            @RequestParam("secondpass") String secondpass,
            //TO DO @RequestParam("devimage") MultipartFile devimage,
            ModelMap mm,
            RedirectAttributes redirectAttributes) {

        try {
            if (accountService.existsAccountByEmail(acc.getEmail())) {
                System.out.println("There is an account with that email: " + acc.getEmail());
                mm.addAttribute("kindoferror", "There is an account with that email.");
                return "error";
            }

            if (!acc.getPassword().equals(secondpass)) {
                redirectAttributes.addFlashAttribute("passerror", "Γραψτα σωστα");

                return "redirect:preregisteraccount";
            }
            acc.setPassword(passwordEncoder.encode(secondpass));
            //need to set the role foreign key to 2 - next line might need to be checked/corrected
            acc.setRolesId(new Role(2));

            //if all is ok add the new user account to database
            accountService.insertAccount(acc);

            mm.addAttribute("account", acc);
            return "index";
        } catch (Exception e) {
            e.printStackTrace();
            mm.addAttribute("kindoferror", e.getMessage());
            return "error";
        }
    }
}
