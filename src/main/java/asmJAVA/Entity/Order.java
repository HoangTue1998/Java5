package asmJAVA.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Component
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "create_date", nullable = false)
    private Date createDate;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "status")
    private Integer status;

    @Column(name = "total")
    private Double total;

    @Column(name = "name")
    private String name;

    @Column(name = "phone")
    private String phone;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Account userDatHang;

    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderdetails;


}