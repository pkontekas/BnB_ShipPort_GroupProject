package spring.bnb.boats.services;

import spring.bnb.boats.models.Boatphoto;

public interface BoatphotoService {

    public void storeFilesToDB(Boatphoto boatphoto);
    
    Boatphoto findDefaultBoatphotoByBoatsIdNative(Integer boatsId);
}
