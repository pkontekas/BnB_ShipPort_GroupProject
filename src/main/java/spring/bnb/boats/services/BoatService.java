package spring.bnb.boats.services;

import java.util.List;
import org.springframework.data.domain.Page;
import spring.bnb.boats.models.Boat;

public interface BoatService {
    
     public List<Boat> getAllBoats();
    
    public Page<Boat> getAllBoats(int pageNumber);
    
    public Boat insertBoat(Boat boat);
    
    public Boat getBoatById(int boatid);
}
