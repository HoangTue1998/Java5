package asmJAVA.Server;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import asmJAVA.Entity.Category;

import java.util.List;

public interface ICategoryService {
    public List<Category> getAll();
    public Page<Category> findPageAll(Pageable pageable);
    public Category insert(Category category);
    public Category update(Category category);
    public Category delete(Integer id);
    public Category findById(Integer id);
}
