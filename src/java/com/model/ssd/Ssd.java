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
    private String detail;

    public Ssd(int id, String detail) {
        this.id = id;
        this.detail = detail;
    }

    public Ssd() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    
}
