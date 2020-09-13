package spring.bnb.boats.repos;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import spring.bnb.boats.models.Booking;

/**
 * @author pkontekas
 */
public interface BookRepo extends JpaRepository<Booking, Integer> {

    @Query(
            value = "SELECT * FROM bookings\n"
            + "WHERE accounts_id = ?1",
            nativeQuery = true)
    List<Booking> findMyBookingsByAccountsId(int id);
}
