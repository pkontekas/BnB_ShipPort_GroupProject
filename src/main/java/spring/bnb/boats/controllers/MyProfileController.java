package spring.bnb.boats.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import org.apache.tomcat.util.codec.binary.Base64;
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
import spring.bnb.boats.dao.ImageDao;
import spring.bnb.boats.models.Account;
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
    public String findCurrentAccountProfile(ModelMap mm,
            @ModelAttribute("passerror") String error,
            @ModelAttribute("updateresult") String updateresult,
            Principal principal) {

        String accountEmail = principal.getName();
        Account dbAccount = accountService.getAccountByEmail(accountEmail);
        ImageDao imgDao = new ImageDao();
        //check if profile photo exists and if it does encode it in base64
        if (dbAccount.getProfilePic() != null) {
            if (dbAccount.getProfilePic().length > 0) {
                byte[] imageBeforeEncoding = Base64.encodeBase64(dbAccount.getProfilePic());
                mm = imgDao.encodeImageToBase64(imageBeforeEncoding, mm, "oldprofilepic");
            }
        }
        //clearing password
        dbAccount.setPassword("");

        mm.addAttribute("oldaccount", dbAccount);
        mm.addAttribute("passerror", error);
        mm.addAttribute("upresult", updateresult);
        return "profile";
    }

    @PostMapping("/doupdateaccount")
    public String updateTrainer(
            @ModelAttribute("oldaccount") Account acc,
            @RequestParam("profilepic") MultipartFile profilepic,
            @RequestParam("oldpass") String currentpass,
            ModelMap mm,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        Account dbAccount = accountService.getAccountByEmail(principal.getName());
        try {
            //set picture if not empty in form and valid length
            if (!profilepic.isEmpty() && profilepic.getBytes().length > 0) {
                acc.setProfilePic(profilepic.getBytes());
            } else {//if form is empty we will need to reupload original picture if it exists
                if (dbAccount.getProfilePic() != null) {
                    if (dbAccount.getProfilePic().length > 0) {
                        acc.setProfilePic(dbAccount.getProfilePic());
                    }
                }
                else {
                //TO DO Set a default picture from static image
                }
            }
            String dbpass = dbAccount.getPassword();
            String newpass = acc.getPassword();
            //if passwords are all OK then encode it and set it
            if (passwordEncoder.matches(currentpass, dbpass) && newpass.length() >= 8) {
                acc.setPassword(passwordEncoder.encode(newpass));
            }//if passwords ok but newpass not entered, reinsert current pass in db
            else if (passwordEncoder.matches(currentpass, dbpass) && newpass.length() == 0) {
                acc.setPassword(passwordEncoder.encode(currentpass));
            }//if current password does not match the db one, redirect back to form
            else if (!passwordEncoder.matches(currentpass, dbpass)) {
                redirectAttributes.addFlashAttribute("passerror", "Current password invalid, so no changes made!");
                return "redirect:preupdateaccount";
            } else {//in all other cases new password is problematic in characters so redirect back to form
                redirectAttributes.addFlashAttribute("passerror", "Insufficient characters in new password!");
                return "redirect:preupdateaccount";
            }
            //if all ok update Account
            accountService.updateAccount(acc);
            //clearing password
            acc.setPassword("");
            redirectAttributes.addFlashAttribute("updateresult", "Success, changes done!");
            return "redirect:preupdateaccount";

        } catch (Exception e) {
            e.printStackTrace();
            mm.addAttribute("kindoferror", e.getMessage());
            return "error";
        }
    }
}
