package spring.bnb.boats.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookingController {
    
   @RequestMapping("/booking")
    public String bookingForm() {
        return "my-reservations";
    }
    
    @RequestMapping("/myreservations")
    public String myReservations() {
        return "my-reservations";
    }
    
}
