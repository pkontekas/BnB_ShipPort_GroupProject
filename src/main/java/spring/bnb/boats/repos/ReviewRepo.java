package spring.bnb.boats.repos;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import spring.bnb.boats.models.Review;

public interface ReviewRepo extends JpaRepository<Review, Integer>{
    
    @Query(
            value = "SELECT reviews.* FROM bookings, reviews\n"
            + "WHERE bookings.reviews_id = reviews.id\n"
            + "and bookings.boats_id = ?1",
            nativeQuery = true)
    public List<Review> getAllReviewsPerBoat(int boatid);
}
