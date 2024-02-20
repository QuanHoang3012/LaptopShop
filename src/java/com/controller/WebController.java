/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.controller;

import com.model.cpu.CpuDAO;
import com.model.laptop.LaptopDAO;
import com.model.manufacturer.ManufacturerDAO;
import com.model.order.OrderDAO;
import com.model.ram.RamDAO;
import com.model.screen.ScreenDAO;
import com.model.ssd.SsdDAO;

/**
 *
 * @author Anh Quan
 */
public class WebController {
     CpuDAO  cpudao ;
     LaptopDAO laptopdao;
     ManufacturerDAO manudao;
    RamDAO ramdao;
     ScreenDAO screendao ;
     SsdDAO ssddao;
    OrderDAO orderdao;
    
    private static  WebController instance = null;
    private WebController() {
         laptopdao = new LaptopDAO();
         cpudao = new CpuDAO();
         manudao = new ManufacturerDAO();
         ramdao = new RamDAO();
         screendao = new ScreenDAO();
         ssddao = new SsdDAO();
         orderdao = new OrderDAO();
    }
    public static  WebController getInstance () {
            if(instance == null) {
                instance = new WebController();
        }
            return instance;
    }
      
}
