/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.bnb.boats.models.Boatphoto;
import spring.bnb.boats.repos.BoatphotoRepo;

/**
 *
 * @author mapan
 */
@Service
public class BoatphotoServiceImpl implements BoatphotosService{
    
    @Autowired
    BoatphotoRepo boatphotoRepo;

    @Transactional
    @Override
    public void storeFilesToDB(Boatphoto boatphoto) {
        boatphotoRepo.save(boatphoto);
    }
    
}
