package spring.bnb.boats.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.bnb.boats.dao.ImageHandlerDao;
import spring.bnb.boats.dao.ReviewHandlerDao;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.models.Boat;
import spring.bnb.boats.models.Port;
import spring.bnb.boats.models.Review;
import spring.bnb.boats.services.AccountService;
import spring.bnb.boats.services.BoatService;
import spring.bnb.boats.services.BoatphotoService;
import spring.bnb.boats.services.PortService;
import spring.bnb.boats.services.PortphotoService;
import spring.bnb.boats.services.ReviewService;

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
    BoatphotoService bpService;

    @Autowired
    ReviewService reviewService;

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
                redirectAttributes.addFlashAttribute("profpicmissing", "Please first upload a Profile Picture to register a ship!");
                return "redirect:preupdateaccount";
            }
        }
        redirectAttributes.addFlashAttribute("profpicmissing", "Please first upload a Profile Picture to register a ship!");
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

    @GetMapping("/showallboats/{portFilter}/{boatFilter}")
    public String listAllBoatsFilters(ModelMap mm,
            HttpSession session,
            @PathVariable(value = "portFilter") String pFilter,
            @PathVariable(value = "boatFilter") String bFilter) {

        session.setAttribute("portFilter", pFilter);
        session.setAttribute("boatFilter", bFilter);

        return "json-all-boats";
    }

    @GetMapping("/showboatinfo") // TODO make it POST instead of GET -> error 405 method not allowed
    public String showBoatInfo(ModelMap mm,
            @RequestParam(name = "boatId") int id,
            @ModelAttribute("bookingissue") String bookMessage) {

        Boat boat = boatService.getBoatById(id);
        mm.addAttribute("boatdetails", boat);

        List<Review> reviews = new ArrayList<>();
        reviews = reviewService.getAllReviewsPerBoat(id);
        ReviewHandlerDao reviewDao = new ReviewHandlerDao();
        reviewDao.getReviewAverages(mm, reviews);

        //using the port this boat is located to get the specific photos for next boat info page
        ImageHandlerDao imgDao = new ImageHandlerDao();
        byte[] imageBeforeEncoding = Base64.encodeBase64(ppService.getPortphotoByPortsId(boat.getPortsId().getId()).getPhoto());
        mm = imgDao.encodeImageToBase64AndPutToMm(imageBeforeEncoding, mm, "portimage");

        imageBeforeEncoding = Base64.encodeBase64(bpService.findDefaultBoatphotoByBoatsIdNative(boat.getId()).getPhoto());
        mm = imgDao.encodeImageToBase64AndPutToMm(imageBeforeEncoding, mm, "boatimage");

        imageBeforeEncoding = Base64.encodeBase64(accountService.getAccountByBoatIdNative(boat.getId()).getProfilePic());
        mm = imgDao.encodeImageToBase64AndPutToMm(imageBeforeEncoding, mm, "ownerimage");

        mm.addAttribute("bookingissue", bookMessage);
        return "boat-info";
    }
}
