package spring.bnb.boats.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import spring.bnb.boats.models.Account;

public interface AccountRepo extends JpaRepository<Account, Integer> {

    public Account findByEmail(String email);

    public boolean existsAccountByEmail(String email);

    @Query(
            value = "SELECT accounts.* FROM accounts\n"
            + "JOIN boats ON accounts.id = boats.accounts_id\n"
            + "WHERE boats.id = ?1 LIMIT 1;",
            nativeQuery = true)
    public Account getAccountByBoatIdNative(int boatid);
}
