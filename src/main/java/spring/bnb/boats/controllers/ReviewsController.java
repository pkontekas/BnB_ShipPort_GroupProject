/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Dionisis
 */
@Controller
public class ReviewsController {
     @RequestMapping("/reviews")
    public String myReservations() {
        return "reviews";
    }
}
