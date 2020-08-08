package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.bnb.boats.models.Port;

public interface PortRepo extends JpaRepository<Port, Integer>{
    
    public Port getPortById(int portid);
}
