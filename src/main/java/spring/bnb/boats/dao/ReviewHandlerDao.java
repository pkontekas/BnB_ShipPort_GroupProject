package spring.bnb.boats.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.ui.ModelMap;
import spring.bnb.boats.models.Review;

/**
 * @author pkontekas
 */
public class ReviewHandlerDao {

    public ModelMap getReviewAverages(ModelMap mm, List<Review> reviews) {

        List<Double> reviewAvg = new ArrayList<>();
        if (!reviews.isEmpty()) {
            double stars = 0;
            double maintenance = 0;
            double cleanliness = 0;
            double comfort = 0;
            double harbour = 0;
            double hospitality = 0;
            double valueForMoney = 0;

            int reviewSize = reviews.size();
            for (int i = 0; i < reviewSize; i++) {
                Review rev = new Review();
                rev = reviews.get(i);
                stars = (stars + rev.getStars());
                maintenance = (maintenance + rev.getGeneralMaintenance());
                cleanliness = (cleanliness + rev.getCleanliness());
                comfort = (comfort + rev.getComfort());
                harbour = (harbour + rev.getHarbour());
                hospitality = (hospitality + rev.getHospitality());
                valueForMoney = (valueForMoney + rev.getValueForMoney());
            }

            double starsAvg = (stars / reviewSize);
            double maintenanceAvg = ((maintenance / reviewSize) * 10);
            double cleanlinessAvg = ((cleanliness / reviewSize) * 10);
            double comfortAvg = ((comfort / reviewSize) * 10);
            double harbourAvg = ((harbour / reviewSize) * 10);
            double hospitalityAvg = ((hospitality / reviewSize) * 10);
            double valueForMoneyAvg = ((valueForMoney / reviewSize) * 10);

            reviewAvg.add(starsAvg);
            reviewAvg.add(maintenanceAvg);
            reviewAvg.add(cleanlinessAvg);
            reviewAvg.add(comfortAvg);
            reviewAvg.add(harbourAvg);
            reviewAvg.add(hospitalityAvg);
            reviewAvg.add(valueForMoneyAvg);
            mm.addAttribute("reviewAvg", reviewAvg);
            mm.addAttribute("reviewsLength", reviewSize);
        }
        return mm;
    }
}
