package asmJAVA.Repository;


import org.springframework.data.jpa.repository.JpaRepository;

import asmJAVA.Entity.OrderDetail;

public interface IOrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
}