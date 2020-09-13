package spring.bnb.boats.services;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.bnb.boats.models.Booking;
import spring.bnb.boats.repos.BookRepo;

/**
 * @author pkontekas
 */
@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    BookRepo bookRepo;

    @Transactional
    @Override
    public Booking insertBooking(Booking booking) {
        return bookRepo.save(booking);
    }

    @Override
    public List<Booking> findBookingsByAccountsId(int id) {
        return bookRepo.findMyBookingsByAccountsIdNative(id);
    }

    @Override
    public Integer getCountFromOverlappingBookingDatesNative(int boatid, Date startDate, Date endDate) {
        Integer count = bookRepo.getCountFromOverlappingBookingDatesNative(boatid, startDate, endDate);
        if (count == null) {
            count = 0;
        }
        return count;
    }

}
