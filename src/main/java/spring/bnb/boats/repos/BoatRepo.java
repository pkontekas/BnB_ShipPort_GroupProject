package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.bnb.boats.models.Boat;

public interface BoatRepo extends JpaRepository<Boat, Integer> {
    
}
