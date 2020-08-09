package spring.bnb.boats.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Portphoto;
import spring.bnb.boats.repos.PortphotoRepo;

@Service
public class PortphotoServiceImpl implements PortphotoService {

    @Autowired
    PortphotoRepo ppRepo;

    @Override
    public Portphoto getPortphotoByPortsId(int portsid) {
        return ppRepo.findByPortsId(portsid);
    }


}
