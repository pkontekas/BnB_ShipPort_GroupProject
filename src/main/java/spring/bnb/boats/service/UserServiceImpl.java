/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.MyUser;
import spring.bnb.boats.models.Role;
import spring.bnb.boats.repos.UserRepo;

@Service
public class UserServiceImpl implements UserService{
    
    @Autowired
    UserRepo userRepo;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
       MyUser myuser = userRepo.findByEmail(email);
       if (myuser == null) {
            throw new UsernameNotFoundException("Invalid username");
        }
       User springSecurityUser = new User(myuser.getEmail(), myuser.getPassword(), mapRolesToAuthorities(myuser.getRolesId()));
       return springSecurityUser;
    }
    
    private List<SimpleGrantedAuthority> mapRolesToAuthorities(Role role) {
        List<SimpleGrantedAuthority> authorities = new ArrayList();
        
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRole());
        authorities.add(authority);
        
        return authorities;
    }
}
