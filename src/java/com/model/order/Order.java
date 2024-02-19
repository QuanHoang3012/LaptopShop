/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.order;

import java.util.Date;

/**
 *
 * @author Anh Quan
 */
public class Order {
    private int id;
    private Date date;
    private int customerId;
    private double totalMoney;

    public Order() {
    }

    public Order(int id, Date date, int customerId, double totalMoney) {
        this.id = id;
        this.date = date;
        this.customerId = customerId;
        this.totalMoney = totalMoney;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
    
    
}
