package asmJAVA.Server;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import asmJAVA.Entity.OrderDetail;

import java.util.List;

public interface IOrderDetailsService {
    public List<OrderDetail> getAll();
    public Page<OrderDetail> findPageAll(Pageable pageable);
    public OrderDetail insert(OrderDetail orderDetail);
    public OrderDetail update(OrderDetail orderDetail);
    public OrderDetail delete(Integer id);
    public OrderDetail findById(Integer id);
}
