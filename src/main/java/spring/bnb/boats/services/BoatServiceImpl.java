package spring.bnb.boats.services;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Boat;
import spring.bnb.boats.repos.BoatRepo;

@Service
public class BoatServiceImpl implements BoatService {

    @Autowired
    BoatRepo boatRepo;

    @Transactional
    @Override
    public Boat insertBoat(Boat boat) {
        return boatRepo.save(boat);
    }

    @Override
    public List<Boat> getAllBoats() {
        return boatRepo.findAll();
    }
//OLD PAGEABLE method
//    @Override
//    public Page<Boat> getAllBoats(int pageNumber) {
//        Pageable pageable = PageRequest.of(pageNumber - 1, 4);
//        return boatRepo.findAll(pageable);
//    }

    @Override
    public Boat getBoatById(int boatid) {
        return boatRepo.getOne(boatid);
    }

    @Override
    public Map<Integer, Integer> getCountOfBoatsPerPort() {
        Map<Integer, Integer> portsBoatsMap = new HashMap<>();
        List<Integer[]> portidAndBoats = boatRepo.getTotalBoatsPerPortNative();
        for (Integer[] integer : portidAndBoats) {
            Integer key = integer[0];
            Integer value = integer[1];
            portsBoatsMap.put(key,value);
        }
        return portsBoatsMap;
    }

    @Override
    public Map<String, Double> getAverageOfBoatsPerBoatType() {
        Map<String, Double> typesBoatsMap = new HashMap<>();
        List<Object[]> typeAndBoatsNum = boatRepo.getTotalBoatsPerBoatTypeNative();
        long countBoats = boatRepo.count();
        for (Object[] obj : typeAndBoatsNum) {
            String key = (String) obj[0];
            BigInteger boatsNum = (BigInteger) obj[1];
            Double boatsPerType = boatsNum.doubleValue();
            Double value = boatsPerType/countBoats;
            typesBoatsMap.put(key,value);
        }
        return typesBoatsMap;
    }
}
