package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import spring.bnb.boats.models.Boatphoto;

public interface BoatphotoRepo extends JpaRepository<Boatphoto, Integer> {

    @Query(
            value = "SELECT * FROM boatphotos WHERE defaultphoto = 1 AND boats_id = ?1 LIMIT 1;",
            nativeQuery = true)
    Boatphoto findDefaultBoatphotoByBoatsIdNative(Integer boatsId);

}
