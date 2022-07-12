package asmJAVA.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import asmJAVA.Entity.Account;

@Repository
public interface IAccountRepository extends JpaRepository<Account, Integer> {
    Account findByEmail(String email);
}