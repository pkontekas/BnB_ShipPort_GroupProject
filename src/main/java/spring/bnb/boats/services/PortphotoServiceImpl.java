package spring.bnb.boats.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Port;
import spring.bnb.boats.models.Portphoto;
import spring.bnb.boats.repos.PortRepo;
import spring.bnb.boats.repos.PortphotoRepo;

@Service
public class PortphotoServiceImpl implements PortphotoService {

    @Autowired
    PortphotoRepo ppRepo;

    @Autowired
    PortRepo portRepo;

    @Override
    public Portphoto getPortphotoByPortsId(int portsid) {
        
        Port port = portRepo.getPortById(portsid);
        return ppRepo.getOne(port.getId());
    }
}
