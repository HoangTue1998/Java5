package asmJAVA.Repository;


import org.springframework.data.jpa.repository.JpaRepository;

import asmJAVA.Entity.Category;

public interface ICategoryRepository extends JpaRepository<Category, Integer> {
}