package spring.bnb.boats.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Role;
import spring.bnb.boats.repos.RoleRepo;

@Service
public class RoleServiceImpl implements RoleService{
    
    @Autowired
    RoleRepo roleRepo;

    @Override
    public Role fetchRoleById(int id) {
        return roleRepo.getOne(id);
    }
     
}
