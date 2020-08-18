/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.controllers;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import spring.bnb.boats.models.Boatphoto;
import spring.bnb.boats.services.BoatphotosService;

/**
 *
 * @author mapan
 */
@Controller
public class BoatphotoController {
    
    @Autowired
    BoatphotosService boatphotoService;
    
    @PostMapping("/uploadphotoboat")
    public String uploadBoatphoto(@RequestParam(value = "boatphoto") MultipartFile multipart){
        Boatphoto boatphoto = new Boatphoto();
        boatphoto.setPhotoName(multipart.getOriginalFilename());
        
        try {
            boatphoto.setPhoto(multipart.getBytes());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        boatphotoService.storeFilesToDB(boatphoto);
        return "index";
    }
}
