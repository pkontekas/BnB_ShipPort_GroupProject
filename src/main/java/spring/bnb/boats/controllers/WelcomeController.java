package spring.bnb.boats.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {

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
    public String showChat() {
        return "chat";
    }

}
