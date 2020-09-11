/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Review;
import spring.bnb.boats.repos.ReviewRepo;

/**
 *
 * @author mapan
 */
@Service
public class ReviewServiceImpl implements ReviewService{
    
    @Autowired
    ReviewRepo reviewRepo;

    @Override
    public List<Review> getAllReviewsPerBoat(int boatid) {
        List<Review> emptyReview = new ArrayList<>();
       return Optional.of(reviewRepo.getAllReviewsPerBoat(boatid)).orElse(emptyReview);
    }

    @Override
    public List<Review> getAllReviews() {
        return reviewRepo.findAll();
    }
    
}
