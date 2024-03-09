/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.ssd;

/**
 *
 * @author Anh Quan
 */
public class Ssd {
    private int id;
    private String name;

    public Ssd(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Ssd() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String detail) {
        this.name = detail;
    }
    
}
