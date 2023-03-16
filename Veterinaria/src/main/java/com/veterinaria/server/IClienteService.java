/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.server;

import com.veterinaria.entity.Cliente;
import java.util.List;



/**
 *
 * @author Melissa Ruiz Cruz
 */
public interface IClienteService {
    public List<Cliente> getAllCliente();
    public Cliente getClienteById(long id);
    public void saveCliente(Cliente cliente);
    public void delete(long id);
    
}
