package spring.bnb.boats.controllers;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import spring.bnb.boats.models.Boat;
import spring.bnb.boats.services.BoatService;
import spring.bnb.boats.services.BoatphotoService;

/**
 * @author pkontekas
 */
@Controller
public class RestController {
    
    @Autowired
    BoatService boatService;
    
    @Autowired
    BoatphotoService boatphotoService;
        
    @ResponseBody
    @GetMapping("/api/allboats")
    public List<Boat> showAllBoatsJson() {
        
        List<Boat> allboats;
        allboats = boatService.getAllBoats();
        return allboats;
    }
    
    @ResponseBody
    @GetMapping("/api/boatimages")
    public Map<Integer, String> showAllBoatImagesJson() {
        
        List<Boat> boats;
        boats = boatService.getAllBoats();
        
        Map<Integer, String> boatPhotosEncoded = new HashMap<>();

        byte[] imageBeforeEncoding;
        String base64EncodedImage;
        //looping through the boats
        for (int i = 0; i < boats.size(); i++) {
            imageBeforeEncoding = Base64.encodeBase64(boatphotoService.findDefaultBoatphotoByBoatsIdNative(boats.get(i).getId()).getPhoto());
            try {
                base64EncodedImage = new String(imageBeforeEncoding, "UTF-8");
                boatPhotosEncoded.put(boats.get(i).getId(), base64EncodedImage);
            } catch (UnsupportedEncodingException ex) {
                //TO DO to fix this: If image does not exist we get an exception and we are thrown into error page
                ex.printStackTrace();
            }
        }
        return boatPhotosEncoded;
    }
}
