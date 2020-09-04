package spring.bnb.boats.services;

import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.models.Role;
import spring.bnb.boats.repos.AccountRepo;
import spring.bnb.boats.repos.RoleRepo;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    AccountRepo accountRepo;

    @Autowired
    RoleRepo roleRepo;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Account myuser = accountRepo.findByEmail(email);
        if (myuser == null) {
            throw new UsernameNotFoundException("Mail address not found!");
        }
        User springSecurityUser = new User(myuser.getEmail(), myuser.getPassword(), mapRolesToAuthorities(myuser.getRolesId()));
        return springSecurityUser;
    }

    private List<SimpleGrantedAuthority> mapRolesToAuthorities(Role role) {
        List<SimpleGrantedAuthority> authorities = new ArrayList();

        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
        authorities.add(authority);

        return authorities;
    }

    @Transactional
    @Override
    public void insertAccount(Account acc) {
        accountRepo.save(acc);
    }

    @Override
    public String checkIfEmailExists(String email) {
        Account tempacc = accountRepo.findByEmail(email);
        if (tempacc == null) {
            return "Email ok";
        }
        return "Email taken";
    }

    @Override
    public boolean existsAccountByEmail(String email) {
        return accountRepo.existsAccountByEmail(email);
    }

    @Override
    public Account getAccountByEmail(String email) {
        return accountRepo.findByEmail(email);
    }

    @Transactional
    @Override
    public void updateAccountRoleToOwner(int accountId, int roleId) {
        
        Account myaccount = accountRepo.getOne(accountId);
        if (roleId != 3) {
            myaccount.setRolesId(roleRepo.getOne(3));
            accountRepo.save(myaccount);
        }
    }

    @Transactional
    @Override
    public void updateAccount(Account a) {
        accountRepo.save(a);
    }
}