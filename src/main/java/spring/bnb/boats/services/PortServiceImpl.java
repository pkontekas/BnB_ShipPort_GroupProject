package spring.bnb.boats.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Port;
import spring.bnb.boats.repos.PortRepo;

@Service
public class PortServiceImpl implements PortService{
    
    @Autowired
    PortRepo portRepo;

    @Override
    public List<Port> getAllPorts() {
        return portRepo.findAll();
    }

    @Override
    public Port getPortById(int portid) {
        return portRepo.getOne(portid);
    }
    
    
}
