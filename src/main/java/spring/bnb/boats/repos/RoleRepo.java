package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.bnb.boats.models.Role;

public interface RoleRepo extends JpaRepository<Role, Integer>{
    
}
