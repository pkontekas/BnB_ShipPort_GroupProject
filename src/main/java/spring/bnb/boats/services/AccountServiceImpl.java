package spring.bnb.boats.services;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.models.Role;
import spring.bnb.boats.repos.AccountRepo;

@Service
public class AccountServiceImpl implements AccountService{
    
    @Autowired
    AccountRepo accountRepo;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
       Account myuser = accountRepo.findByEmail(email);
       if (myuser == null) {
            throw new UsernameNotFoundException("Invalid email");
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
