package spring.bnb.boats.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StaticPageController {

    @RequestMapping("/contactus")
    public String contactus() {
        return "contact-us";
    }

    @RequestMapping("/aboutus")
    public String aboutus() {
        return "about";
    }

    @RequestMapping("/reviews")
    public String showReviewWall() {
        return "reviews";
    }
}
