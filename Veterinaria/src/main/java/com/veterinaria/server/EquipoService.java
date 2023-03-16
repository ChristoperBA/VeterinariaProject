/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.server;

import com.veterinaria.entity.Equipo;
import com.veterinaria.repository.EquipoRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



/**
 *
 * @author Melissa Ruiz Cruz
 */
@Service
public class EquipoService implements IEquipoService{
    @Autowired
    private EquipoRepository equipoRepository;

    @Override
    public List<Equipo> buscartodos() {
        return (List<Equipo>) equipoRepository.findAll();
    }
    
}
