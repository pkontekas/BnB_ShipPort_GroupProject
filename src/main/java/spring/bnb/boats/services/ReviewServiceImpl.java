package spring.bnb.boats.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Review;
import spring.bnb.boats.repos.ReviewRepo;

/**
 * @author mapan
 */
@Service
public class ReviewServiceImpl implements ReviewService{
    
    @Autowired
    ReviewRepo reviewRepo;

    @Override
    public List<Review> getAllReviewsPerBoat(int boatid) {
        List<Review> emptyReview = new ArrayList<>();
       return Optional.of(reviewRepo.getAllReviewsPerBoatNative(boatid)).orElse(emptyReview);
    }
    
}