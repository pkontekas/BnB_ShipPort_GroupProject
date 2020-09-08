package spring.bnb.boats.controllers;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import spring.bnb.boats.dao.ImageDao;
import spring.bnb.boats.dto.BoatDto;
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
    BoatphotoService bpService;

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
            imageBeforeEncoding = Base64.encodeBase64(bpService.findDefaultBoatphotoByBoatsIdNative(boats.get(i).getId()).getPhoto());
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

    @ResponseBody
    @GetMapping("/api/boatimage/{boatid}")
    public String showBoatImageURL(int boatid) {

        ImageDao imgDao = new ImageDao();
        byte[] imageBeforeEncoding = Base64.encodeBase64(bpService.findDefaultBoatphotoByBoatsIdNative(boatid).getPhoto());
        //System.out.println(imgDao.encodeImageToBase64(imageBeforeEncoding));
        return imgDao.encodeImageToBase64(imageBeforeEncoding);
    }

//    @GetMapping(
//            value = "/api/getimage/{boatid}",
//            produces = MediaType.IMAGE_JPEG_VALUE
//    )
//    public @ResponseBody
//    byte[] getImageWithMediaType(int boatid) throws IOException {
//
//        InputStream in = getClass()
//                .getResourceAsStream("/com/baeldung/produceimage/image.jpg");
//        return IOUtils.toByteArray(in);
//    }
    @ResponseBody
    @GetMapping("/api/allboatdtos")
    public List<BoatDto> showAllBoatsDtoJson() {

        BoatDto boatDto = new BoatDto(); 
        List<Boat> allboats;
        allboats = boatService.getAllBoats();
        List<BoatDto> allboatdtos = new ArrayList<>();
        
        ImageDao imgDao = new ImageDao();
        byte[] imageBeforeEncoding;
        
        for (int i = 0; i < allboats.size(); i++) {
            boatDto.setId(allboats.get(i).getId());
            boatDto.setManufacturer(allboats.get(i).getManufacturer());
            boatDto.setModel(allboats.get(i).getModel());
            boatDto.setBoatType(allboats.get(i).getBoatType());
            boatDto.setBoatLength(allboats.get(i).getBoatLength());
            boatDto.setConstructionYear(allboats.get(i).getConstructionYear());
            boatDto.setPassengerCapacity(allboats.get(i).getPassengerCapacity());
            boatDto.setBeds(allboats.get(i).getBeds());
            boatDto.setCruiseSpeed(allboats.get(i).getCruiseSpeed());
            boatDto.setFuel(allboats.get(i).getFuel());
            boatDto.setPrice(allboats.get(i).getCurrentPrice());
            boatDto.setCity(allboats.get(i).getPortsId().getCity());
            boatDto.setPortName(allboats.get(i).getPortsId().getPortName());
            //image encoding follows in base64
            imageBeforeEncoding = Base64.encodeBase64(
                    bpService.findDefaultBoatphotoByBoatsIdNative(allboats.get(i).getId()).getPhoto());
            boatDto.setBoatPhoto(imgDao.encodeImageToBase64(imageBeforeEncoding));
            
            allboatdtos.add(boatDto);
            boatDto = new BoatDto();
        }

        return allboatdtos;
    }

}
