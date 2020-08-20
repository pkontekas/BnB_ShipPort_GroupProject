package spring.bnb.boats.controllers;

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
            @ModelAttribute("passerror") String error) {

        mm.addAttribute("newaccount", new Account());
        mm.addAttribute("passerror", error);
        return "registration";
    }

    @PostMapping("/doinsertaccount")
    public String insertAccount(
            @ModelAttribute("newaccount") Account acc,
            @RequestParam("secondpass") String secondpass,
            @RequestParam("profilePic") MultipartFile profilePic,
            ModelMap mm,
            RedirectAttributes redirectAttributes) {

        boolean thereIsError = false;
        try {
            if (accountService.existsAccountByEmail(acc.getEmail())) {
                System.out.println("There is an account with that email: " + acc.getEmail());
                redirectAttributes.addFlashAttribute("emailerror", "Email Account already exists!");
                thereIsError = true;
            }

            if (!acc.getPassword().equals(secondpass)) {
                redirectAttributes.addFlashAttribute("passerror", "Passwords differ!");
                thereIsError = true;

            }
            if (thereIsError) {
                return "redirect:preregisteraccount";
                //must change this, TO DO must find a way to reshow the form with other inputs already filled in from before
                //return "registration";
            }
            // Second way with RequestParam instead of ModelAttribute
            acc.setProfilePic(profilePic.getBytes());

            acc.setPassword(passwordEncoder.encode(secondpass));
            //need to set the role foreign key to 2 -> User 
            acc.setRolesId(roleService.getRoleById(2));

            //if all is ok add the new user account to database
            accountService.insertAccount(acc);

            mm.addAttribute("account", acc);
            return "index";
        } catch (Exception ex) {
            ex.printStackTrace();
            mm.addAttribute("kindoferror", ex.getMessage());
            return "error";
        }
    }
}
