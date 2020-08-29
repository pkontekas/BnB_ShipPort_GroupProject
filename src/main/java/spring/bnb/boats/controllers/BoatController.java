package spring.bnb.boats.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import spring.bnb.boats.services.BoatphotoService;
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
    
    @Autowired
    BoatphotoService bbService;

    @GetMapping("/preregisterboat")
    public String showBoatRegisterForm(ModelMap mm) {
        mm.addAttribute("newboat", new Boat());
        return "boat-registration";
    }

    @PostMapping("/doinsertboat")
    public String insertBoat(ModelMap mm,
            @ModelAttribute("newboat") Boat boat,
            Principal principal) {

        String accountEmail = principal.getName();
        Account account = accountService.getAccountByEmail(accountEmail);
        boat.setAccountsId(account);
        Boat myboat = boatService.insertBoat(boat);
        mm.addAttribute("myboat", myboat);
        accountService.updateAccountRoleToOwner(account.getId(), account.getRolesId().getId());

        return "upload-photoboat";
    }

    @ModelAttribute("allports")
    public List<Port> getListOfPorts() {
        return portService.getAllPorts();
    }

    @GetMapping("/showallboats")
    public String showAllBoats(ModelMap mm) {
        
        List<Boat> boats = boatService.getAllBoats();
        mm.addAttribute("allboats", boats);
        
        Map<Integer,String> boatPhotosEncoded = new HashMap<>();
        
        byte[] imageBeforeEncoding;
        String base64EncodedImage;
        for (int i = 0; i < boats.size(); i++) {
            imageBeforeEncoding = Base64.encodeBase64(bbService.findDefaultBoatphotoByBoatsIdNative(boats.get(i).getId()).getPhoto());
            try {
                base64EncodedImage = new String(imageBeforeEncoding, "UTF-8");
                boatPhotosEncoded.put(boats.get(i).getId(), base64EncodedImage);
            } catch (UnsupportedEncodingException ex) {
                //TO DO to fix this: If image does not exist we get an exception and we are thrown into error page
                ex.printStackTrace();
                mm.addAttribute("kindoferror", ex.getMessage());
            }
        }
        
        //puts whole image boatId-image map in a mm attribute to send it to all-boats in encoded form
        mm.addAttribute("boatImagesMap", boatPhotosEncoded);
        return "all-boats";
    }

    @GetMapping("/showboatinfo") // TODO POST instead of GET -> error 405 method not allowed
    public String showBoatInfo(ModelMap mm, @RequestParam(name = "boatId") int id) {

        Boat boat = boatService.getBoatById(id);
        mm.addAttribute("boatdetails", boat);
        //using the port this boat is located to get the specific port photo

        byte[] imageBeforeEncoding = Base64.encodeBase64(ppService.getPortphotoByPortsId(boat.getPortsId().getId()).getPhoto());
        String base64EncodedImage = "";
        try {
            base64EncodedImage = new String(imageBeforeEncoding, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            //TO DO to fix this: If image does not exist we get an exception and we are thrown into error page
            ex.printStackTrace();
            mm.addAttribute("kindoferror", ex.getMessage());
        }
        //puts encoded port image in a mm attribute to send it to boat-info in encoded form
        mm.addAttribute("portimage", base64EncodedImage);

        imageBeforeEncoding = Base64.encodeBase64(bbService.findDefaultBoatphotoByBoatsIdNative(boat.getId()).getPhoto());
        base64EncodedImage = "";
        try {
            base64EncodedImage = new String(imageBeforeEncoding, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            //TO DO to fix this: If image does not exist we get an exception and we are thrown into error page
            ex.printStackTrace();
            mm.addAttribute("kindoferror", ex.getMessage());
        }
        //puts encoded boat image it in a mm attribute to send it to boat-info in encoded form
        mm.addAttribute("boatimage", base64EncodedImage);
        
        return "boat-info";
    }

}
