package spring.bnb.boats.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.models.Boat;
import spring.bnb.boats.models.Port;
import spring.bnb.boats.services.BoatService;
import spring.bnb.boats.services.PortService;

@Controller
public class BoatController {

    @Autowired
    PortService portService;

    @Autowired
    BoatService boatService;

    @GetMapping("/preregisterboat")
    public String showBoatRegisterForm(ModelMap mm) {
        mm.addAttribute("newboat", new Boat());
        return "boat-registration";
    }

    @PostMapping("/doinsertboat")
    public String insertBoat(@ModelAttribute("newboat") Boat boat) {
        boat.setAccountsId(new Account(1)); // TODO should take the User Acount - Owner from Current Session
        boatService.insertBoat(boat);
        return "index";
    }

    @ModelAttribute("allports")
    public List<Port> getListOfPorts() {
        return portService.getAllPorts();
    }

    @GetMapping("/showallboats")
    public String showAllBoats(ModelMap mm) {
        mm.addAttribute("allboats", boatService.getAllBoats());
        return "all-boats";
    }

    @GetMapping("/showboatinfo") // TODO Post -> error 405 method not allowed
    public String showBoatInfo(ModelMap mm,@RequestParam (name="boatId") int id) {
        Boat boat = boatService.getBoatById(id);
        mm.addAttribute("boatdetails", boat);
        return "boat-info";
    }
   
}
