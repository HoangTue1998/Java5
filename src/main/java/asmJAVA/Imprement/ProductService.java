package asmJAVA.Imprement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import asmJAVA.Entity.Product;
import asmJAVA.Repository.IProductRepository;
import asmJAVA.Server.IProductService;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService implements IProductService {
    @Autowired
    private IProductRepository repository;

    @Override
    public List<Product> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<Product> findPageAll(Pageable pageable) {
        return repository.findAllProduct(pageable);
    }

    @Override
    public Product insert(Product product) {
        product.setId(null);
        return repository.save(product);
    }

    @Override
    public Product update(Product product) {
        Integer id = product.getId();
        if (id != null) {
            Optional<Product> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(product);
            }
        }
        return null;
    }

    @Override
    public Product delete(Integer id) {
        if (id != null) {
            Optional<Product> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Product findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public List<Product> findAllByName(String name) {
        return repository.findAllByName(name);
    }
}
