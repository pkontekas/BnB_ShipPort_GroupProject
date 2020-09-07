package spring.bnb.boats.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.bnb.boats.dao.ImageDao;
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
    public String showBoatRegisterForm(ModelMap mm,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        mm.addAttribute("newboat", new Boat());
        //check if current user has profile picture
        Account account = accountService.getAccountByEmail(principal.getName());
        if (account.getProfilePic() != null) {
            if (account.getProfilePic().length > 0) {
                //if picture exists all is ok
                return "boat-registration";
            } else {//if not, tell him to add one
                redirectAttributes.addFlashAttribute("profpicmissing", "You need to first upload a Profile Picture!");
                return "redirect:preupdateaccount";
            }
        }
        redirectAttributes.addFlashAttribute("profpicmissing", "You need to first upload a Profile Picture!");
        return "redirect:preupdateaccount";
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
        //uploaded boat also needs a picture as minimum so next form opens
        return "upload-photoboat";
    }

    @ModelAttribute("allports")
    public List<Port> getListOfPorts() {
        return portService.getAllPorts();
    }

    @GetMapping("/showallboats")
    public String showAllBoats(ModelMap mm) {
        return listAllBoats(mm, 1);
    }

    @GetMapping("/showallboats/page/{pageNumber}")
    public String listAllBoats(ModelMap mm,
            @PathVariable("pageNumber") int currentPage) {

        Page<Boat> page = boatService.getAllBoats(currentPage);
        List<Boat> boats = page.getContent();
        int totalPages = page.getTotalPages();
        mm.addAttribute("totalPages", totalPages);
        mm.addAttribute("currentPage", currentPage);
        mm.addAttribute("allboats", boats);

        Map<Integer, String> boatPhotosEncoded = new HashMap<>();

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
        return "json-all-boats";
    }

    @GetMapping("/showboatinfo") // TODO make it POST instead of GET -> error 405 method not allowed
    public String showBoatInfo(ModelMap mm,
            @RequestParam(name = "boatId") int id) {

        Boat boat = boatService.getBoatById(id);
        mm.addAttribute("boatdetails", boat);
        //using the port this boat is located to get the specific port photo
        
        ImageDao imgDao = new ImageDao();
        byte[] imageBeforeEncoding = Base64.encodeBase64(ppService.getPortphotoByPortsId(boat.getPortsId().getId()).getPhoto());
        mm = imgDao.encodeImageToBase64(imageBeforeEncoding, mm, "portimage");

        imageBeforeEncoding = Base64.encodeBase64(bbService.findDefaultBoatphotoByBoatsIdNative(boat.getId()).getPhoto());
        mm = imgDao.encodeImageToBase64(imageBeforeEncoding, mm, "boatimage");
        
        imageBeforeEncoding = Base64.encodeBase64(accountService.getAccountByBoatIdNative(boat.getId()).getProfilePic());
        mm = imgDao.encodeImageToBase64(imageBeforeEncoding, mm, "ownerimage");

        return "boat-info";
    }
}
