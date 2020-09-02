package spring.bnb.boats.controllers;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.services.AccountService;
import spring.bnb.boats.services.RoleService;

@Controller
public class RegistrationController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RoleService roleService;

    @GetMapping("/preregisteraccount")
    public String showRegisterForm(ModelMap mm,
            @ModelAttribute("passerror") String passerror,
            @ModelAttribute("mailerror") String mailerror,
            @ModelAttribute("newaccount") Account acc) {

        //check if we have empty newaccount or not and fill the mm newaccount accordingly with empty or previously filled in account
        if (!mm.containsAttribute("newaccount")) {
            mm.addAttribute("newaccount", new Account());
        }
        else {
            mm.addAttribute("newaccount", acc);
        }
        //pass the flash errors on next page
        mm.addAttribute("passerror", passerror);
        mm.addAttribute("mailerror", mailerror);
        return "registration";
    }

    @PostMapping("/doinsertaccount")
    public String insertAccount(
            @ModelAttribute("newaccount") Account acc,
            @RequestParam("secondpass") String secondpass,
            @RequestParam("profilepic") MultipartFile profilepic,
            ModelMap mm,
            RedirectAttributes redirectAttributes) throws IOException {

        boolean thereIsError = false;
        try {
            if (accountService.existsAccountByEmail(acc.getEmail())) {
                System.out.println("There is an account with that email: " + acc.getEmail());
                redirectAttributes.addFlashAttribute("mailerror", "Email Account already exists! Change it!");
                thereIsError = true;
            }

            if (!acc.getPassword().equals(secondpass)) {
                redirectAttributes.addFlashAttribute("passerror", "Passwords differ!");
                thereIsError = true;

            }
            if (thereIsError) {
                //pass the new info from newaccount to next page to prefill the form
                redirectAttributes.addFlashAttribute("newaccount", acc);
                return "redirect:preregisteraccount";
            }

            acc.setProfilePic(profilepic.getBytes());
            acc.setPassword(passwordEncoder.encode(secondpass));
            //need to set the role foreign key to 2 -> User Role
            acc.setRolesId(roleService.getRoleById(2));

            //if all is ok add the new user account to database
            accountService.insertAccount(acc);
            //clearing password
            acc.setPassword("");
            mm.addAttribute("account", acc);
            return "redirect:/login.html";
        } catch (Exception ex) {
            ex.printStackTrace();
            mm.addAttribute("kindoferror", ex.getMessage());
            return "error";
        }
    }
}
