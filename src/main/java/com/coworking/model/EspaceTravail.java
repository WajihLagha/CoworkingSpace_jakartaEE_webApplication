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

    // Getters, setters, constructor
    public EspaceTravail() {}

	public EspaceTravail(Long id, String nom, TypeEspace typeEspace, int capacite, BigDecimal prixHoraire,
			String description) {
		super();
		this.id = id;
		this.nom = nom;
		this.typeEspace = typeEspace;
		this.capacite = capacite;
		this.prixHoraire = prixHoraire;
		this.description = description;
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
    
}
