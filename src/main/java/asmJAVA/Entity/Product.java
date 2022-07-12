package asmJAVA.Entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "products")
@Data
@Component
public class Product {
	@Id
	@Column(name = "id", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "image")
	private String image;

	@Column(name = "price")
	private int price;

	@Column(name = "created_date")
	private Date createdDate;

	@Column(name = "available")
	private int available;

	@Column(name = "material")
	private String material;

	@Column(name = "color")
	private String color;
	
	@Column(name = "describe1")
	private String describe1;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
}
