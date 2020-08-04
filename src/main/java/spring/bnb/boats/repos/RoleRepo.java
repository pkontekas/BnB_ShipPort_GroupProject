/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.bnb.boats.models.Role;

/**
 *
 * @author mapan
 */
public interface RoleRepo extends JpaRepository<Role, Integer>{
    
}
