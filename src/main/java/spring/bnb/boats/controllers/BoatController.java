package spring.bnb.boats.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;
import org.apache.tomcat.util.codec.binary.Base64;
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
import spring.bnb.boats.services.AccountService;
import spring.bnb.boats.services.BoatService;
import spring.bnb.boats.services.PortService;
import spring.bnb.boats.services.PortphotoService;

@Controller
public class BoatController {

    @Autowired
    PortService portService;

    @Autowired
    BoatService boatService;

    @Autowired
    PortphotoService ppService;

    @Autowired
    AccountService accountService;

    @GetMapping("/preregisterboat")
    public String showBoatRegisterForm(ModelMap mm) {
        mm.addAttribute("newboat", new Boat());
        return "boat-registration";
    }

    @PostMapping("/doinsertboat")
    public String insertBoat(ModelMap mm,@ModelAttribute("newboat") Boat boat, Principal principal) {
        String accountEmail = principal.getName();
        Account account = accountService.getAccountByEmail(accountEmail);
        boat.setAccountsId(account);
        boatService.insertBoat(boat);
//        mm.addAttribute("boatid", boat.getId());
        return "upload-photoboat";
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

    @GetMapping("/showboatinfo") // TODO POST instead of GET -> error 405 method not allowed
    public String showBoatInfo(ModelMap mm, @RequestParam(name = "boatId") int id) {
        Boat boat = boatService.getBoatById(id);
        mm.addAttribute("boatdetails", boat);
        //use the port this boat is located to get the specific port photo
        //TO DO to only bring the photo from the correct Port that has defaultPhoto field = 1 or just leave 1 photo per port

        byte[] imageBeforeEncoding = Base64.encodeBase64(ppService.getPortphotoByPortsId(boat.getPortsId().getId()).getPhoto());
        String base64EncodedImage = "";
        try {
            base64EncodedImage = new String(imageBeforeEncoding, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            //TO DO to fix this: If image does not exist we get an exception and we are thrown into error page
            ex.printStackTrace();
            mm.addAttribute("kindoferror", ex.getMessage());
        }
        //puts it in a mm attribute to send it to boat-info in encoded form
        mm.addAttribute("portimage", base64EncodedImage);

        return "boat-info";
    }

}
