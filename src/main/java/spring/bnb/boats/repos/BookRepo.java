package spring.bnb.boats.repos;

import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import spring.bnb.boats.models.Booking;

/**
 * @author pkontekas
 */
public interface BookRepo extends JpaRepository<Booking, Integer> {

    @Query(
            value = "SELECT * FROM bookings\n"
            + "WHERE accounts_id = ?1",
            nativeQuery = true)
    List<Booking> findMyBookingsByAccountsIdNative(int id);

    @Query(
            value = "SELECT count(boats_id) AS total FROM bookings AS b \n"
            + "WHERE b.boats_id = :boatId AND\n"
            + "((b.start_date >= :startDate AND b.start_date <= :endDate) or \n"
            + "(b.end_date >= :startDate AND b.end_date <= :endDate) or \n"
            + "(b.start_date < :startDate AND b.end_date > :endDate))\n"
            + "GROUP BY boats_id;", nativeQuery = true)
    Integer getCountFromOverlappingBookingDatesNative(@Param("boatId") int boatId,
            @Param ("startDate") Date startDate,
            @Param ("endDate") Date endDate);
    
    @Query(
            value = "SELECT * FROM bookings\n"
            + "WHERE bookings.id = ?1",
            nativeQuery = true)
    Booking findMyBookingsByIdNative(int id);
}
