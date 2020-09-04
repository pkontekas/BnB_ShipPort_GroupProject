package spring.bnb.boats.controllers;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.bnb.boats.models.Boatphoto;
import spring.bnb.boats.services.BoatService;
import spring.bnb.boats.services.BoatphotoService;

@Controller
public class BoatphotoController {

    @Autowired
    BoatphotoService boatphotoService;
    
    @Autowired
    BoatService boatService;

    @PostMapping("/uploadphotoboat")
    public String uploadBoatphoto(@RequestParam(value = "photo") MultipartFile multipart,
            @RequestParam(name = "boatid") int id,
            RedirectAttributes redirectAttributes) {
        
        Boatphoto boatphoto = new Boatphoto();
        boatphoto.setPhotoName(multipart.getOriginalFilename());
        
        boatphoto.setBoatsId(boatService.getBoatById(id));
        
        boatphoto.setDefaultphoto(true);
        try {
            boatphoto.setPhoto(multipart.getBytes());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        boatphotoService.storeFilesToDB(boatphoto);
        redirectAttributes.addFlashAttribute("boatsuccess", "Boat successfully registered, would you like to register another?");
        return "redirect:preregisterboat";
    }
}
