package asmJAVA.Repository;


import org.springframework.data.jpa.repository.JpaRepository;

import asmJAVA.Entity.Order;

public interface IOrderRepository extends JpaRepository<Order, Integer> {
}
