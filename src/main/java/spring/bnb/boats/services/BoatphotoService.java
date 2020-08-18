/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.services;

import spring.bnb.boats.models.Boatphoto;

/**
 *
 * @author mapan
 */
public interface BoatphotoService {
    
    public void storeFilesToDB(Boatphoto boatphoto);
}
