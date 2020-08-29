package spring.bnb.boats.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.bnb.boats.models.Boatphoto;
import spring.bnb.boats.repos.BoatRepo;
import spring.bnb.boats.repos.BoatphotoRepo;

@Service
public class BoatphotoServiceImpl implements BoatphotoService {

    @Autowired
    BoatphotoRepo boatphotoRepo;

    @Autowired
    BoatRepo boatRepo;

    @Transactional
    @Override
    public void storeFilesToDB(Boatphoto boatphoto) {
        boatphotoRepo.save(boatphoto);
    }
    
    @Override
    public Boatphoto findDefaultBoatphotoByBoatsIdNative(Integer boatsId)
    {
        return boatphotoRepo.findDefaultBoatphotoByBoatsIdNative(boatsId);
    }

}
