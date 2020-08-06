/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Port;
import spring.bnb.boats.repos.PortRepo;

/**
 *
 * @author mapan
 */
@Service
public class PortServiceImpl implements PortService{
    
    @Autowired
    PortRepo portRepo;

    @Override
    public List<Port> getAllPorts() {
        return portRepo.findAll();
    }
    
    
}
