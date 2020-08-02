package spring.bnb.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author pkontekas, mpantazis, dtsilioris
 */
@RequestMapping("/")
@Controller
public class WelcomeController {
    @RequestMapping
    public String welcome(){
        return "index";
    }
}
