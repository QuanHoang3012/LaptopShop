/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.laptop;

import com.model.cpu.Cpu;
import com.model.images.images;
import com.model.manufacturer.Manufacturer;
import com.model.ram.Ram;
import com.model.screen.Screen;
import com.model.ssd.Ssd;
import java.awt.Image;
import java.util.Date;

/**
 *
 * @author Anh Quan
 */
public class Laptop {
    private int id ;
    private String name;
    private double inPrice , outPrice;
    private int stock;
    private Screen screen;
    private Cpu cpu;
    private Ram ram;
    private Ssd ssd;
    private String card ;
    private Date releaseYear;
    private String origin;
    private double discount;
    private String system;
    private float weight;
    private images image;
    private Manufacturer  manufacturer;

    public Laptop() {
    }

    public Laptop(int id, String name, double inPrice, double outPrice, int stock, Screen screen, Cpu cpu, Ram ram, Ssd ssd, String card, Date releaseYear, String origin, double discount, String system, images image, float weight, Manufacturer manufacturer) {
        this.id = id;
        this.name = name;
        this.inPrice = inPrice;
        this.outPrice = outPrice;
        this.stock = stock;
        this.screen = screen;
        this.cpu = cpu;
        this.ram = ram;
        this.ssd = ssd;
        this.card = card;
        this.releaseYear = releaseYear;
        this.origin = origin;
        this.discount = discount;
        this.system = system;
        this.weight = weight;
        this.image = image;
        this.manufacturer = manufacturer;
    }

    public images getImage() {
        return image;
    }

    public void setImage(images image) {
        this.image = image;
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

    public void setName(String name) {
        this.name = name;
    }

    public double getInPrice() {
        return inPrice;
    }

    public void setInPrice(double inPrice) {
        this.inPrice = inPrice;
    }

    public double getOutPrice() {
        return outPrice;
    }

    public void setOutPrice(double outPrice) {
        this.outPrice = outPrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Screen getScreen() {
        return screen;
    }

    public void setScreen(Screen screen) {
        this.screen = screen;
    }

    public Cpu getCpu() {
        return cpu;
    }

    public void setCpu(Cpu cpu) {
        this.cpu = cpu;
    }

    public Ram getRam() {
        return ram;
    }

    public void setRam(Ram ram) {
        this.ram = ram;
    }

    public Ssd getSsd() {
        return ssd;
    }

    public void setSsd(Ssd ssd) {
        this.ssd = ssd;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public Date getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(Date releaseYear) {
        this.releaseYear = releaseYear;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getSystem() {
        return system;
    }

    public void setSystem(String system) {
        this.system = system;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    
    
}
