package spring.bnb.boats.services;

import java.sql.Blob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.repos.PortphotoRepo;


@Service
public class PortphotoServiceImpl implements PortphotoService {

    @Autowired
    PortphotoRepo portphotoRepo;
    
    @Override
    public Blob getPortphotoById(int id) {
        //this method does not work yet
        //return portphotoRepo.getOne(id).getPhoto();
        return null;
    }
    
}
