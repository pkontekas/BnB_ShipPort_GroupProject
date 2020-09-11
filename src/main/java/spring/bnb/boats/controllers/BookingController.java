package spring.bnb.boats.controllers;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.bnb.boats.dao.UtilDao;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.models.Booking;
import spring.bnb.boats.services.AccountService;
import spring.bnb.boats.services.BoatService;
import spring.bnb.boats.services.BookingService;

@Controller
public class BookingController {

    @Autowired
    BookingService bookService;

    @Autowired
    AccountService accountService;

    @Autowired
    BoatService boatService;

    @PostMapping("/booking")
    public String bookingForm(@RequestParam(name = "startCheckDate") String checkinDate,
            @RequestParam(name = "endCheckDate") String checkoutDate,
            @RequestParam(name = "passengers") int psngs,
            @RequestParam(name = "ownerNotes") String notes,
            @RequestParam(name = "thisBoat") int thisboatId,
            @RequestParam(name = "myprice") double myprice,
            Principal principal) {

        Account renter = accountService.getAccountByEmail(principal.getName());
        Booking book = new Booking();

        UtilDao udao = new UtilDao();
        Date checkin = udao.stringToDate(checkinDate);
        Date checkout = udao.stringToDate(checkoutDate);

        book.setStartDate(checkin);
        book.setEndDate(checkout);
        book.setPassengers(psngs);
        book.setOwnerNotes(notes);
        book.setAccountsId(renter);

        double finalPrice = myprice * udao.getDifferenceBetweenTwoDates(checkin, checkout);
        book.setFinalPrice(finalPrice);

        book.setBoatsId(boatService.getBoatById(thisboatId));

        bookService.insertBooking(book);
        return "my-reservations";
    }

    @RequestMapping("/myreservations")
    public String myReservations() {
        return "my-reservations";
    }

}
