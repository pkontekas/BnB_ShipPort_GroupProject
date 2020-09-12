package spring.bnb.boats.controllers;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring.bnb.boats.dao.DateHandlerDao;
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

        DateHandlerDao udao = new DateHandlerDao();
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
        return "/myreservations";
    }

    @GetMapping("/myreservations")//TO DO must make it a POST Request somehow
    public String myReservations(ModelMap mm,
            Principal principal) {
        
        Account renter = accountService.getAccountByEmail(principal.getName());
        List<Booking> books = bookService.findBookingsByAccountsId(renter.getId());
        mm.addAttribute("mybookings", books);
        mm.addAttribute("rentername", renter.getName());
        mm.addAttribute("rentersurname", renter.getSurname());
        return "my-reservations";
    }

}
