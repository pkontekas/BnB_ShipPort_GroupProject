/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.services;

import java.util.List;
import spring.bnb.boats.models.Review;

/**
 *
 * @author mapan
 */
public interface ReviewService {
    
    public List<Review> getAllReviewsPerBoat(int boatid);
    
    public List<Review> getAllReviews();
}
