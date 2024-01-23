/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.laptop;

import com.model.images.imagesDAO;
import com.model.cpu.Cpu;
import com.model.cpu.CpuDAO;
import com.model.images.images;
import com.model.manufacturer.Manufacturer;
import com.model.manufacturer.ManufacturerDAO;
import com.model.ram.Ram;
import com.model.ram.RamDAO;
import com.model.screen.Screen;
import com.model.screen.ScreenDAO;
import com.model.ssd.Ssd;
import com.model.ssd.SsdDAO;
import com.model.utils.DBUtils;
import java.awt.Image;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class LaptopDAO extends DBUtils {
    
    imagesDAO idb = new imagesDAO();
    ManufacturerDAO mdb = new ManufacturerDAO();
    CpuDAO cdb = new CpuDAO();
    RamDAO rdb = new RamDAO();
    ScreenDAO scdb = new ScreenDAO();
    SsdDAO ssdb = new SsdDAO();

    public List<Laptop> getAll() {
        List<Laptop> list = new ArrayList<>();
        String sql = "Select * from [Laptop] ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Laptop lp = new Laptop();
                lp.setId(rs.getInt("id"));
                lp.setName(rs.getString("name"));
                lp.setInPrice(rs.getDouble("inPrice"));
                lp.setOutPrice(rs.getDouble("OutPrice"));
                lp.setStock(rs.getInt("stock"));
                Screen sc = scdb.getScreenbyId(rs.getInt("screenId"));
                lp.setScreen(sc);
                Cpu c = cdb.getCpubyId(rs.getInt("cpuId"));
                lp.setCpu(c);
                Ram r = rdb.getRambyId(rs.getInt("ramId"));
                lp.setRam(r);
                Ssd ss = ssdb.getSsdbyId(rs.getInt("ssdId"));
                lp.setSsd(ss);
                lp.setCard(rs.getString("card"));
                lp.setReleaseYear(rs.getDate("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));
                images i = idb.getImagesbyId(rs.getInt("id"));
                lp.setImage(i);
                lp.setWeight(rs.getFloat("weight"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
        }
        return list;
    }
     public List<Laptop> getListByPage(List<Laptop> list, int start , int end){
        List<Laptop> arr = new ArrayList<>();
        for (int i= start ; i<end;i++){
            arr.add(list.get(i));
        }
        return arr;
    }
     public List<Laptop> searchByName(String search){
        List<Laptop> list = new ArrayList<>();
        String sql="Select * from [Laptop] where 1=1";
         if(search != null && !search.equals("")) {
             sql += "and name like '%"+search+"%' ";
         }
             try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
             while (rs.next()) {
                Laptop lp = new Laptop();
                lp.setId(rs.getInt("id"));
                lp.setName(rs.getString("name"));
                lp.setInPrice(rs.getDouble("inPrice"));
                lp.setOutPrice(rs.getDouble("OutPrice"));
                lp.setStock(rs.getInt("stock"));
                Screen sc = scdb.getScreenbyId(rs.getInt("screenId"));
                lp.setScreen(sc);
                Cpu c = cdb.getCpubyId(rs.getInt("cpuId"));
                lp.setCpu(c);
                Ram r = rdb.getRambyId(rs.getInt("ramId"));
                lp.setRam(r);
                Ssd ss = ssdb.getSsdbyId(rs.getInt("ssdId"));
                lp.setSsd(ss);
                lp.setCard(rs.getString("card"));
                lp.setReleaseYear(rs.getDate("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));
                lp.setWeight(rs.getFloat("weight"));
                images i = idb.getImagesbyId(rs.getInt("id"));
                lp.setImage(i);
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
        }
        return list;
     }
}
