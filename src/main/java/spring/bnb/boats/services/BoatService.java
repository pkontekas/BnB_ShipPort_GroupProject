package spring.bnb.boats.services;

import java.util.List;
import java.util.Map;
import spring.bnb.boats.models.Boat;

public interface BoatService {
    
     public List<Boat> getAllBoats();
    
    //public Page<Boat> getAllBoats(int pageNumber);
    
    public Boat insertBoat(Boat boat);
    
    public Boat getBoatById(int boatid);
    
    public Map<Integer, Integer> getCountOfBoatsPerPort();
    
    public Map<String, Double> getAverageOfBoatsPerBoatType();
}
