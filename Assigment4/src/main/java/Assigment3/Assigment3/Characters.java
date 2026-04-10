package Assigment3.Assigment3;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/** Represents one character stored in the database. */
@Entity
@Table(name = "characters")
public class Characters {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "role", nullable = false)
	private String role;

	@Column(name = "age", nullable = false)
	private double age;

	@Column(name = "universe", nullable = false)
	private String universe;

	@Column(name = "species", nullable = false)
	private String species;

	@Column(name = "activeDate", nullable = false)
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date activeDate;

	public Characters() {}

	public Characters(String name, String role, double age, String universe, String species, Date activeDate) {
		this.name = name;
		this.role = role;
		this.age = age;
		this.universe = universe;
		this.species = species;
		this.activeDate = activeDate;
	}

	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getRole() { return role; }
	public void setRole(String role) { this.role = role; }

	public double getAge() { return age; }
	public void setAge(double age) { this.age = age; }

	public String getUniverse() { return universe; }
	public void setUniverse(String universe) { this.universe = universe; }

	public String getSpecies() { return species; }
	public void setSpecies(String species) { this.species = species; }

	public Date getActiveDate() { return activeDate; }
	public void setActiveDate(Date activeDate) { this.activeDate = activeDate; }
}
