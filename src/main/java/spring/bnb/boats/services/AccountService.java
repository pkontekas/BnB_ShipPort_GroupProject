package spring.bnb.boats.services;

import org.springframework.security.core.userdetails.UserDetailsService;
import spring.bnb.boats.models.Account;

public interface AccountService extends UserDetailsService {

    public void insertAccount(Account acc);

    //either of next 2 methods can be used to check if email exists
    public String checkIfEmailExists(String email);
    
    public boolean existsAccountByEmail(String email);
    
    public Account getAccountByEmail(String email);
    
    //for future TO DO
    public void updateAccountRole(Integer accountId, Integer roleId);
}
