/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.controller;

import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author User
 */
public class LoginController {
    
    @GetMapping("/login")
    public String index(){
        return "/login";
    }
}
