package com.coworking.service;

import com.coworking.dao.EspaceTravailDAO;
import com.coworking.model.EspaceTravail;
import com.coworking.model.TypeEspace;
import java.util.List;

public class EspaceTravailService {
    private EspaceTravailDAO dao = new EspaceTravailDAO();

    public void creerEspace(EspaceTravail espace) {
        dao.save(espace);
    }

    public List<EspaceTravail> listerEspaces() {
        return dao.findAll();
    }

    public List<EspaceTravail> listerEspacesParType(TypeEspace type) {
        return dao.findByType(type);
    }
    
    public void modifierEspace(EspaceTravail espace) {
        dao.update(espace);
    }

    public void supprimerEspace(Long id) {
        dao.delete(id);
    }
    
    public EspaceTravail findById(Long id) {
        return dao.findById(id);
    }
}
