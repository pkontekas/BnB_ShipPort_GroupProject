package spring.bnb.boats.services;

import java.util.List;
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
    public void insertBoat(Boat boat) {
        boatRepo.save(boat);
    }

    @Override
    public List<Boat> getAllBoats() {
        return boatRepo.findAll();
    }

    @Override
    public Boat getBoatById(int boatid) {
        return boatRepo.getOne(boatid);
    }

}
