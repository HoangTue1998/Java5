package asmJAVA.Server;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import asmJAVA.Entity.Account;

import java.util.List;

public interface IAccountService {
    public List<Account> getAll();
    public Page<Account> findPageAll(Pageable pageable);
    public Account insert(Account account);
    public Account update(Account account);
    public Account delete(Integer id);
    public Account findById(Integer id);
    public Account findByEmail(String email);
}
