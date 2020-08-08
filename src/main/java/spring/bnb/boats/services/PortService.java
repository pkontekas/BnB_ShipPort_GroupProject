package spring.bnb.boats.services;

import java.util.List;
import spring.bnb.boats.models.Port;

public interface PortService {
    
    public List<Port> getAllPorts();
    
    public Port getPortById(int portid);
}
