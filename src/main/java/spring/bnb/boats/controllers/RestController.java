package spring.bnb.boats.controllers;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import spring.bnb.boats.dao.DateHandlerDao;
import spring.bnb.boats.dao.ImageHandlerDao;
import spring.bnb.boats.dto.BoatDto;
import spring.bnb.boats.models.Boat;
import spring.bnb.boats.models.Booking;
import spring.bnb.boats.models.Review;
import spring.bnb.boats.services.BoatService;
import spring.bnb.boats.services.BoatphotoService;
import spring.bnb.boats.services.BookingService;
import spring.bnb.boats.services.ReviewService;

/**
 * @author pkontekas
 */
@Controller
public class RestController {

    @Autowired
    BoatService boatService;

    @Autowired
    BoatphotoService bpService;

    @Autowired
    ReviewService reviewService;

    @Autowired
    BookingService bookService;

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

    //will be used in future refactoring
//    @ResponseBody
//    @GetMapping("/api/boatimage/{boatid}")
//    public String showBoatImageURL(int boatid) {
//
//        ImageHandlerDao imgDao = new ImageHandlerDao();
//        byte[] imageBeforeEncoding = Base64.encodeBase64(bpService.findDefaultBoatphotoByBoatsIdNative(boatid).getPhoto());
//        return imgDao.encodeImageToBase64(imageBeforeEncoding);
//    }

    @ResponseBody
    @GetMapping("/api/allboatdtos")
    public List<BoatDto> showAllBoatsDtoJson() {

        List<Boat> allboats;
        allboats = boatService.getAllBoats();
        List<BoatDto> allboatdtos = new ArrayList<>();

        ImageHandlerDao imgDao = new ImageHandlerDao();
        byte[] imageBeforeEncoding;

        for (int i = 0; i < allboats.size(); i++) {
            BoatDto boatDto = new BoatDto();
            Boat boat = allboats.get(i);
            boatDto.setId(boat.getId());
            boatDto.setManufacturer(boat.getManufacturer());
            boatDto.setModel(boat.getModel());
            boatDto.setBoatType(boat.getBoatType());
            boatDto.setBoatLength(boat.getBoatLength());
            boatDto.setConstructionYear(boat.getConstructionYear());
            boatDto.setPassengerCapacity(boat.getPassengerCapacity());
            boatDto.setBeds(boat.getBeds());
            boatDto.setCruiseSpeed(boat.getCruiseSpeed());
            boatDto.setFuel(boat.getFuel());
            boatDto.setPrice(boat.getCurrentPrice());
            boatDto.setCity(boat.getPortsId().getCity());
            boatDto.setPortName(boat.getPortsId().getPortName());
            // Average of stars calculation
            List<Booking> bookings = (List<Booking>) boat.getBookingCollection();
            double starsSum = 0;
            int revCount = 0;
            for (Booking booking : bookings) {
                Review review = booking.getReviewsId();
                if(review != null){
                    starsSum = starsSum + review.getStars();
                    revCount = revCount + 1;
                }
            }
            if(revCount > 0){
                boatDto.setStarsAvg(starsSum / revCount);
            }
            //image encoding follows in base64
            imageBeforeEncoding = Base64.encodeBase64(
                    bpService.findDefaultBoatphotoByBoatsIdNative(boat.getId()).getPhoto());
            boatDto.setBoatPhoto(imgDao.encodeImageToBase64(imageBeforeEncoding));
            allboatdtos.add(boatDto);
        }
        return allboatdtos;
    }

    @ResponseBody
    //for Ajax call javascript method to check booking availability in boatinfo.js
    @GetMapping("/api/availability/{boatid}/{startDate}/{endDate}")
    public String checkBookingAvailabilityViaDatesJson(@PathVariable("boatid") int boatid,
            @PathVariable("startDate") String startDate,
            @PathVariable("endDate") String endDate) {

        DateHandlerDao udao = new DateHandlerDao();
        Date sDate = new Date();
        Date eDate = new Date();
        try {
            sDate = udao.stringToDate(startDate);
            eDate = udao.stringToDate(endDate);
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        Integer overlapCount = bookService.getCountFromOverlappingBookingDatesNative(boatid, sDate, eDate);
        if (overlapCount > 0) {
            //we have unavailability on these dates
            return "false";
        } else {//all is ok
            return "true";
        }
    }
}
