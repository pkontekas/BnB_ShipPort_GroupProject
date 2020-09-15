package spring.bnb.boats.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.bnb.boats.models.Booking;
import spring.bnb.boats.models.Review;
import spring.bnb.boats.services.BookingService;
import spring.bnb.boats.services.ReviewService;

@Controller
public class RateController {

    @Autowired
    BookingService bookService;

    @Autowired
    ReviewService reviewService;

    @GetMapping("/myreservations/rate/{bookid}/")
    public String showRateForm(@PathVariable("bookid") int bookId,
            ModelMap mm,
            RedirectAttributes redirectAttributes) {

        int reviewCount = reviewService.getReviewCountByBookingId(bookId);
        if (reviewCount == 1) {
            redirectAttributes.addAttribute("rateMessage", "You already gave feedback for this Booking!");
            return "redirect:/myreservations";
        }
        mm.addAttribute("newreview", new Review());
        mm.addAttribute("bookid", bookId);
        return "rate";
    }

    @PostMapping("/doratereview")
    public String insertReview(
            @ModelAttribute("newreview") Review review,
            @RequestParam("bid") int bookingId,
            ModelMap mm,
            RedirectAttributes redirectAttributes) {

        Booking thisBooking = bookService.findBookingById(bookingId);
        Review newreview = reviewService.insertReview(review);

        thisBooking.setReviewsId(newreview);
        bookService.updateBooking(thisBooking);

        redirectAttributes.addAttribute("rateMessage", "Review added thanks for the feedback!");
        return "redirect:/myreservations";
    }
}
