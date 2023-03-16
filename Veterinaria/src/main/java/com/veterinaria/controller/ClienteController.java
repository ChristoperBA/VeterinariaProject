/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.controller;

import com.veterinaria.entity.Cliente;
import com.veterinaria.entity.Equipo;
import com.veterinaria.server.IClienteService;
import com.veterinaria.server.IEquipoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


/**
 *
 * @author Melissa Ruiz Cruz
 */
@Controller
public class ClienteController {
    
    @Autowired
    private IClienteService clienteService;

    @Autowired
    private IEquipoService equipoService;

    @GetMapping("/cliente")
    public String index(Model model) {
        List<Cliente> listacliente = clienteService.getAllCliente();
        model.addAttribute("titulo","Tabla De Clientes");
        model.addAttribute("cliente",listacliente);
        return "cliente";
    }
    
    @GetMapping("/clienteN")
    public String crearCliente(Model model) {
        List<Equipo> listaequipos = equipoService.buscartodos();
        model.addAttribute("cliente", new Cliente());
        model.addAttribute("equipos",listaequipos);
        return "crear";
    }
    
    @GetMapping("/delete/{id}")
    public String eliminarCliente(@PathVariable("id") Long idCliente) {
        clienteService.delete(idCliente);
        return "redirect:/cliente";
    }

    @PostMapping("/save")
    public String guardarCliente(@ModelAttribute Cliente cliente) {
        clienteService.saveCliente(cliente);
        return "redirect:/cliente";
    }
    
    @GetMapping("/editCliente/{id}")
    public String editarCliente(@PathVariable("id") Long idCliente, Model model) {
        Cliente cliente = clienteService.getClienteById(idCliente);
        List<Equipo> listaequipos = equipoService.buscartodos();
        model.addAttribute("cliente", cliente);
        model.addAttribute("equipos", listaequipos);
        return "crear";
    }
    
}
