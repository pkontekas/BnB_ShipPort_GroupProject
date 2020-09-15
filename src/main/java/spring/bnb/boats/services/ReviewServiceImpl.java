package spring.bnb.boats.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Review;
import spring.bnb.boats.repos.ReviewRepo;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewRepo reviewRepo;

    @Override
    public List<Review> getAllReviewsPerBoat(int boatid) {
        List<Review> emptyReview = new ArrayList<>();
        return Optional.of(reviewRepo.getAllReviewsPerBoatNative(boatid)).orElse(emptyReview);
    }

    @Override
    @Transactional
    public Review insertReview(Review review) {
        return reviewRepo.save(review);
    }

    @Override
    public Integer getReviewCountByBookingId(int bookid) {
        Integer count = reviewRepo.getReviewCountByBookingIdNative(bookid);
        if (count == null) {
            count = 0;
        }
        return count;
    }
}
