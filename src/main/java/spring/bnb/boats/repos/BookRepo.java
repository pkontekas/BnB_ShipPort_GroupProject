package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.bnb.boats.models.Booking;

/**
 * @author pkontekas
 */
public interface BookRepo extends JpaRepository<Booking, Integer> {
    
}
