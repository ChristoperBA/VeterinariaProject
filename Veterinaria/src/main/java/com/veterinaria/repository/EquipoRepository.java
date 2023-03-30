/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.repository;

import com.veterinaria.entity.Equipo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



/**
 *
 * @author Melissa Ruiz Cruz
 */
@Repository
public interface EquipoRepository extends CrudRepository<Equipo,Long> {
    
}
