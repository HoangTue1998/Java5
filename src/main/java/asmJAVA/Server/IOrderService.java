package asmJAVA.Server;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import asmJAVA.Entity.Order;

import java.util.List;

public interface IOrderService {
    public List<Order> getAll();
    public Page<Order> findPageAll(Pageable pageable);
    public Order insert(Order order);
    public Order update(Order order);
    public Order delete(Integer id);
    public Order findById(Integer id);
}
