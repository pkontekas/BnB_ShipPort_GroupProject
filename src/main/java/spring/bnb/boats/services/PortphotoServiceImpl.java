package spring.bnb.boats.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Portphoto;
import spring.bnb.boats.repos.PortphotoRepo;

@Service
public class PortphotoServiceImpl implements PortphotoService {

    @Autowired
    PortphotoRepo portphotoRepo;

    @Override
    public Portphoto getPortphotoByPortsId(int portsid) {
        //this method does not work yet
        //portphotoRepo.getOne();
        //Port port = portRepo.getPortById(portsid);
//        Blob image;
//        try {
//            image = new javax.sql.rowset.serial.SerialBlob(portphotoRepo.getOne(port.));
//            return image;
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
        return null;
    }


}
