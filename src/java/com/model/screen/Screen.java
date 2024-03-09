/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.screen;

/**
 *
 * @author Anh Quan
 */
public class Screen {
    private int id;
    private String name;

    public Screen(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Screen() {
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
