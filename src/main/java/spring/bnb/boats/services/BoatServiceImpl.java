package spring.bnb.boats.services;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    
    @Override
    public Page<Boat> getAllBoats(int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 4);
        return boatRepo.findAll(pageable);
    }

    @Override
    public Boat getBoatById(int boatid) {
        return boatRepo.getOne(boatid);
    }

}
