/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.server;

import com.veterinaria.entity.Cliente;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author User
 */
public class Userprincipal implements UserDetails{
    private Cliente cliente;

    public Userprincipal(Cliente cliente) {
        this.cliente = cliente;
    }
@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        
 //Extract List of permission (name)
        this.cliente.getPermissionsList().forEach(p -> {
            GrantedAuthority authority = new SimpleGrantedAuthority(p);
            authorities.add(authority);
        });
        
 //Extract list of roles (Role_name)
        this.cliente.getRoleList().forEach(r -> {
            GrantedAuthority authority = new SimpleGrantedAuthority("Role_" + r);
            authorities.add(authority);
        });
        return authorities;
    }
    
@Override

    public String getPassword() {
        return this.cliente.getPassword();
    }

    @Override
    public String getUsername() {
        return this.cliente.getNombre_propietario();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return this.cliente.getActive() == 1;
    }
}