package asmJAVA.Imprement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import asmJAVA.Entity.Account;
import asmJAVA.Repository.IAccountRepository;
import asmJAVA.Server.IAccountService;

import java.util.List;
import java.util.Optional;

@Service
public class AccountService implements IAccountService {

    @Autowired
    private IAccountRepository repository;

    @Override
    public List<Account> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<Account> findPageAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Account insert(Account account) {
        account.setId(null);
        return repository.save(account);
    }

    @Override
    public Account update(Account account) {
        Integer id = account.getId();
        if (id != null) {
            Optional<Account> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(account);
            }
        }
        return null;
    }

    @Override
    public Account delete(Integer id) {
        if (id != null) {
            Optional<Account> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Account findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public Account findByEmail(String email) {
        return repository.findByEmail(email);
    }
}
