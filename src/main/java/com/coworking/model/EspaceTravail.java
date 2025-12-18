package com.coworking.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "EspaceTravail")
public class EspaceTravail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 80)
	private String nom;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private TypeEspace typeEspace;

	@Column(nullable = false)
	private int capacite;

	@Column(nullable = false, precision = 10, scale = 2)
	private BigDecimal prixHoraire;

	@Column(length = 255)
	private String description;

	@Column(length = 255)
	private String image;

	@Transient
	private double averageRating;

	// Getters, setters, constructor
	public EspaceTravail() {
	}

	public EspaceTravail(Long id, String nom, TypeEspace typeEspace, int capacite, BigDecimal prixHoraire,
			String description, String image) {
		super();
		this.id = id;
		this.nom = nom;
		this.typeEspace = typeEspace;
		this.capacite = capacite;
		this.prixHoraire = prixHoraire;
		this.description = description;
		this.image = image;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public TypeEspace getTypeEspace() {
		return typeEspace;
	}

	public void setTypeEspace(TypeEspace typeEspace) {
		this.typeEspace = typeEspace;
	}

	public int getCapacite() {
		return capacite;
	}

	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}

	public BigDecimal getPrixHoraire() {
		return prixHoraire;
	}

	public void setPrixHoraire(BigDecimal prixHoraire) {
		this.prixHoraire = prixHoraire;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
