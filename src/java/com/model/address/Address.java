/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.address;

import com.model.account.Account;

/**
 *
 * @author Anh Quan
 */
public class Address {
        private int id;
        private Account account;
        private String name;
        private String phone;
        private String address;

    public Address() {
    }

    public Address(int id, Account account, String name,String phone, String address) {
        this.id = id;
        this.account = account;
        this.name = name;
        this.address = address;
        this.phone= phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
        
        
}
