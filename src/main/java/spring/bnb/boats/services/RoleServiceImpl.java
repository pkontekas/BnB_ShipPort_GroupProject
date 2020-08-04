/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.services;

import org.springframework.beans.factory.annotation.Autowired;
import spring.bnb.boats.models.Role;
import spring.bnb.boats.repos.RoleRepo;

/**
 *
 * @author mapan
 */
public class RoleServiceImpl implements RoleService{
    
    @Autowired
    RoleRepo roleRepo;

    @Override
    public Role fetchRoleByID(int id) {
        return roleRepo.findById(id).get();
    }
    
    
}
