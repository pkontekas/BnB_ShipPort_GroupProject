/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.repos.AccountRepo;

/**
 *
 * @author pkontekas
 */
//@Controller
//public class LoginController {
//
//    @Autowired
//    AccountRepo accountRepo;
//
//    @PostMapping("/performlogin")
//    public String loggedInSystem(@RequestParam("email") String email,
//            @RequestParam("password") String password) {
//
//        Account tempAccount = new Account();
//        tempAccount = loadUserByUsername(email);
//
//        return "/";
//    }
//}
