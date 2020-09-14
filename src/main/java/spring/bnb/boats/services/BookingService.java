package spring.bnb.boats.services;

import java.util.Date;
import java.util.List;
import spring.bnb.boats.models.Booking;

/**
 * @author pkontekas
 */
public interface BookingService {
    
        Booking insertBooking(Booking booking);
        
        Booking updateBooking(Booking booking);
        
        List<Booking> findBookingsByAccountsId(int id);
        
        Integer getCountFromOverlappingBookingDatesNative(int boatid, Date startDate, Date endDate);
        
        Booking findBookingById(int id);
}