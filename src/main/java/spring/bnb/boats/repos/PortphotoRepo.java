package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.bnb.boats.models.Portphoto;

public interface PortphotoRepo extends JpaRepository<Portphoto, Integer> {
    
    Portphoto findByPortsId(int portsid);
}