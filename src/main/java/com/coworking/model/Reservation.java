package com.coworking.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "Reservation")
public class Reservation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false)
	private LocalDateTime dateHeureDebut;

	@Column(nullable = false)
	private LocalDateTime dateHeureFin;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private StatutReservation statut;

	@Column(nullable = false, precision = 10, scale = 2)
	private BigDecimal montantTotal;

	@Column(nullable = false)
	private LocalDateTime dateCreation;

	@ManyToOne
	@JoinColumn(name = "utilisateur_id", nullable = false)
	private Utilisateur utilisateur;

	@ManyToOne
	@JoinColumn(name = "espaceTravail_id", nullable = false)
	private EspaceTravail espaceTravail;

	@ManyToMany
	@JoinTable(name = "Reservation_Supplement", joinColumns = @JoinColumn(name = "reservation_id"), inverseJoinColumns = @JoinColumn(name = "supplement_id"))
	private List<Supplement> supplements;

	public Reservation() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getDateHeureDebut() {
		return dateHeureDebut;
	}

	public void setDateHeureDebut(LocalDateTime dateHeureDebut) {
		this.dateHeureDebut = dateHeureDebut;
	}

	public LocalDateTime getDateHeureFin() {
		return dateHeureFin;
	}

	public void setDateHeureFin(LocalDateTime dateHeureFin) {
		this.dateHeureFin = dateHeureFin;
	}

	public StatutReservation getStatut() {
		return statut;
	}

	public void setStatut(StatutReservation statut) {
		this.statut = statut;
	}

	public BigDecimal getMontantTotal() {
		return montantTotal;
	}

	public void setMontantTotal(BigDecimal montantTotal) {
		this.montantTotal = montantTotal;
	}

	public LocalDateTime getDateCreation() {
		return dateCreation;
	}

	public void setDateCreation(LocalDateTime dateCreation) {
		this.dateCreation = dateCreation;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public EspaceTravail getEspaceTravail() {
		return espaceTravail;
	}

	public void setEspaceTravail(EspaceTravail espaceTravail) {
		this.espaceTravail = espaceTravail;
	}

	public List<Supplement> getSupplements() {
		return supplements;
	}

	public void setSupplements(List<Supplement> supplements) {
		this.supplements = supplements;
	}

	public String getFormattedDateHeureDebut() {
		if (dateHeureDebut != null) {
			return java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm").format(dateHeureDebut);
		}
		return "";
	}

	public String getFormattedDateHeureFin() {
		if (dateHeureFin != null) {
			return java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm").format(dateHeureFin);
		}
		return "";
	}

}
