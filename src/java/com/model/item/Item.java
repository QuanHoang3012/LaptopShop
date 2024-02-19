/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.item;

import com.model.laptop.Laptop;

/**
 *
 * @author Anh Quan
 */
public class Item {
    private Laptop laptop;
    private int quantity;
    private double price;

    public Item() {
    }

    public Item(Laptop laptop, int quantity, double price) {
        this.laptop = laptop;
        this.quantity = quantity;
        this.price = price;
    }

    public Laptop getLaptop() {
        return laptop;
    }

    public void setLaptop(Laptop laptop) {
        this.laptop = laptop;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
