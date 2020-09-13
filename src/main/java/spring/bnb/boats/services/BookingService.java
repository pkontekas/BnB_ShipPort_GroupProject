package spring.bnb.boats.services;

import java.util.Date;
import java.util.List;
import spring.bnb.boats.models.Booking;

/**
 * @author pkontekas
 */
public interface BookingService {
    
        public Booking insertBooking(Booking booking);
        
        List<Booking> findBookingsByAccountsId(int id);
        
        public Integer getCountFromOverlappingBookingDatesNative(int boatid, Date startDate, Date endDate);
}
