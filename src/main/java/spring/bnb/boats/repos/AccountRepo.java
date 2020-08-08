package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.bnb.boats.models.Account;


public interface AccountRepo extends JpaRepository<Account, Integer>{
    
    public Account findByEmail(String email);
    
    public boolean existsAccountByEmail(String email);
}
