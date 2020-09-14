package spring.bnb.boats.repos;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import spring.bnb.boats.models.Boat;

public interface BoatRepo extends JpaRepository<Boat, Integer> {
    
    @Query(
            value = "SELECT ports_id, count(id) FROM boats\n"
            + "GROUP BY ports_id;",
            nativeQuery = true)
    public List<Integer[]> getTotalBoatsPerPortNative();
    
    @Query(
            value = "SELECT boat_type, count(id) FROM boats\n"
            + "GROUP BY boat_type;",
            nativeQuery = true)
    public List<Object[]> getTotalBoatsPerBoatTypeNative();
}
