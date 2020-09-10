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
import spring.bnb.boats.dao.ImageDao;
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

    //old method for pagination
//    @GetMapping("/showallboats")
//    public String showAllBoats(ModelMap mm) {
//        return listAllBoats(mm, 1);
//    }
    @GetMapping("/showallboats/{boatTypeOrPort}")
    public String listAllBoats(ModelMap mm,
            HttpSession session,
            @PathVariable(value = "boatTypeOrPort") String bptype)
            //@PathVariable("pageNumber") int currentPage)
    {
        session.setAttribute("filterselected", bptype);

        //old pagination code
//        Page<Boat> page = boatService.getAllBoats(currentPage);
//        List<Boat> boats = page.getContent();
//        int totalPages = page.getTotalPages();
//        mm.addAttribute("totalPages", totalPages);
//        mm.addAttribute("currentPage", currentPage);

//        will be needed if we go back to old page
//        List<Boat> boats = boatService.getAllBoats();
//        mm.addAttribute("allboats", boats);
        
        //create a map to store boat ids as keys and base64 encoded images
        //from boats as values to later have them in our page
//        Map<Integer, String> boatPhotosEncoded = new HashMap<>();
//        byte[] imageBeforeEncoding;
//        String base64EncodedImage;
//        //looping through the boats
//        for (int i = 0; i < boats.size(); i++) {
//            imageBeforeEncoding = Base64.encodeBase64(bbService.findDefaultBoatphotoByBoatsIdNative(boats.get(i).getId()).getPhoto());
//            try {
//                base64EncodedImage = new String(imageBeforeEncoding, "UTF-8");
//                boatPhotosEncoded.put(boats.get(i).getId(), base64EncodedImage);
//            } catch (UnsupportedEncodingException ex) {
//                //TO DO to fix this: If image does not exist we get an exception and we are thrown into error page
//                ex.printStackTrace();
//                mm.addAttribute("kindoferror", ex.getMessage());
//            }
//        }
//        //puts whole image boatId-image map in a mm attribute to send it to all-boats in encoded form
//        mm.addAttribute("boatImagesMap", boatPhotosEncoded);

        return "json-all-boats";
    }

    @GetMapping("/showboatinfo") // TODO make it POST instead of GET -> error 405 method not allowed
    public String showBoatInfo(ModelMap mm,
            @RequestParam(name = "boatId") int id) {

        Boat boat = boatService.getBoatById(id);
        mm.addAttribute("boatdetails", boat);
        List<Review> reviews = new ArrayList<>();
        reviews = reviewService.getAllReviewsPerBoat(id);
        List<Double> reviewAvg = new ArrayList<>();
        if(!reviews.isEmpty()){
            double stars = 0;
            double maintenance = 0;
            double cleanliness = 0;
            double comfort = 0;
            double harbour = 0;
            double hospitality = 0;
            double valueForMoney = 0;
            for (int i = 0; i < reviews.size(); i++) {
                stars = (stars + reviews.get(i).getStars());
                maintenance =  (maintenance + reviews.get(i).getGeneralMaintenance());
                cleanliness = (cleanliness + reviews.get(i).getCleanliness());
                comfort =  (comfort + reviews.get(i).getComfort());
                harbour = (harbour + reviews.get(i).getHarbour());
                hospitality = (hospitality + reviews.get(i).getHospitality());
                valueForMoney = (valueForMoney + reviews.get(i).getValueForMoney());
            }
            double starsAvg =  (stars / reviews.size());
            double maintenanceAvg = ((maintenance/reviews.size()) * 10);
            double cleanlinessAvg =  ((cleanliness/reviews.size()) * 10);
            double comfortAvg =  ((comfort/reviews.size()) * 10);
            double harbourAvg =  ((harbour/reviews.size()) * 10);
            double hospitalityAvg =  ((hospitality/reviews.size()) * 10);
            double valueForMoneyAvg =  ((valueForMoney/reviews.size()) * 10);
            
            reviewAvg.add(starsAvg);
            reviewAvg.add(maintenanceAvg);
            reviewAvg.add(cleanlinessAvg);
            reviewAvg.add(comfortAvg);
            reviewAvg.add(harbourAvg);
            reviewAvg.add(hospitalityAvg);
            reviewAvg.add(valueForMoneyAvg);
            mm.addAttribute("reviewAvg", reviewAvg);
            mm.addAttribute("reviewsLength", reviews.size());
        }
        
        //using the port this boat is located to get the specific port photo

        ImageDao imgDao = new ImageDao();
        byte[] imageBeforeEncoding = Base64.encodeBase64(ppService.getPortphotoByPortsId(boat.getPortsId().getId()).getPhoto());
        mm = imgDao.encodeImageToBase64AndPutToMm(imageBeforeEncoding, mm, "portimage");

        imageBeforeEncoding = Base64.encodeBase64(bpService.findDefaultBoatphotoByBoatsIdNative(boat.getId()).getPhoto());
        mm = imgDao.encodeImageToBase64AndPutToMm(imageBeforeEncoding, mm, "boatimage");

        imageBeforeEncoding = Base64.encodeBase64(accountService.getAccountByBoatIdNative(boat.getId()).getProfilePic());
        mm = imgDao.encodeImageToBase64AndPutToMm(imageBeforeEncoding, mm, "ownerimage");

        return "boat-info";
    }

}
