package spring.bnb.boats.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import spring.bnb.boats.models.Boat;
import spring.bnb.boats.services.BoatService;

/**
 * @author pkontekas
 */
@Controller
public class RestController {
    
    @Autowired
    BoatService boatService;
    
    @ResponseBody
    @GetMapping("/api/allboats")
    public List<Boat> showAllBoatsJson() {
        
        List<Boat> allboats;
        allboats = boatService.getAllBoats();
        return allboats;
    }
    
}
