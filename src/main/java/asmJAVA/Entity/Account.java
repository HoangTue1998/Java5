package asmJAVA.Entity;

import lombok.Data;

import java.util.Date;

import javax.persistence.*;

@Data
@Entity
@Table(name = "accounts")

public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "fullname")
	private String fullname;

	@Column(name = "email")
	private String email;

	@Column(name = "activated")
	private int activated;

	@Column(name = "admin")
	private int admin;

}
