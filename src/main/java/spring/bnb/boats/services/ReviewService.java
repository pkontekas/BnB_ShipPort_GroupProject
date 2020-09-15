package spring.bnb.boats.services;

import java.util.List;
import spring.bnb.boats.models.Review;

public interface ReviewService {
    
    public List<Review> getAllReviewsPerBoat(int boatid);
    
    public Review insertReview(Review review);
    
    public Integer getReviewCountByBookingId(int bookid);
}
