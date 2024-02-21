/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.laptop;

import com.model.cpu.Cpu;
import com.model.cpu.CpuDAO;
import com.model.manufacturer.Manufacturer;
import com.model.manufacturer.ManufacturerDAO;
import com.model.ram.Ram;
import com.model.ram.RamDAO;
import com.model.screen.Screen;
import com.model.screen.ScreenDAO;
import com.model.ssd.Ssd;
import com.model.ssd.SsdDAO;
import com.model.utils.DBUtils;
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

    ManufacturerDAO mdb = new ManufacturerDAO();
    CpuDAO cdb = new CpuDAO();
    RamDAO rdb = new RamDAO();
    ScreenDAO scdb = new ScreenDAO();
    SsdDAO ssdb = new SsdDAO();

    public List<String> getImagesbyLaptopId(int laptopId) {
        List<String> list = new ArrayList<>();
        String sql = "Select * from  [Laptop_Shop].[dbo].[images] where laptopId=" + laptopId;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String image = rs.getString("href");
                list.add(image);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Laptop> getAllLaptop(int option) {
        List<Laptop> list = new ArrayList<>();
        String sql = "Select * from [Laptop]";
        if (option == 1) {
            sql += " order by discount";
        } else if (option == 2) {
            sql += " order by discount desc";
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
                Ssd ssd = ssdb.getSsdbyId(rs.getInt("ssdId"));
                lp.setSsd(ssd);
                lp.setCard(rs.getString("card"));
                lp.setReleaseYear(rs.getDate("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));
                List<String> image = getImagesbyLaptopId(lp.getId());
                lp.setImage(image);
                lp.setDescription(rs.getNString("description"));
                lp.setWeight(rs.getFloat("weight"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Laptop> getListByPage(List<Laptop> list, int start, int end) {
        List<Laptop> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Laptop> searchByName(String search, int option) {
        List<Laptop> list = new ArrayList<>();
        String sql = "Select * from [Laptop] where 1=1";
        if (search != null && !search.equals("")) {
            sql += "and name like '%" + search + "%' ";
        }
        if (option == 1) {
            sql += " order by discount";
        } else if (option == 2) {
            sql += " order by discount desc";
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
               List<String> image = getImagesbyLaptopId(rs.getInt("id"));
                lp.setImage(image);
                lp.setDescription(rs.getNString("description"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Laptop> searchByCheck(int manuId[], int screenId[], int ramId[], int cpuId[], int ssdId[], double from, double end, int option) {
        List<Laptop> list = new ArrayList<>();
        String sql = "select * from laptop where 1=1";
        if (manuId != null && manuId[0] != 0) {
            sql += " and manufacturerId in(";
            for (int i = 0; i < manuId.length; i++) {
                sql += manuId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (ramId != null && ramId[0] != 0) {
            sql += " and ramId in(";
            for (int i = 0; i < ramId.length; i++) {
                sql += ramId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (screenId != null && screenId[0] != 0) {
            sql += " and screenId in(";
            for (int i = 0; i < screenId.length; i++) {
                sql += screenId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (cpuId != null && cpuId[0] != 0) {
            sql += " and cpuId in(";
            for (int i = 0; i < cpuId.length; i++) {
                sql += cpuId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (ssdId != null && ssdId[0] != 0) {
            sql += " and ssdId in(";
            for (int i = 0; i < cpuId.length; i++) {
                sql += ssdId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (from != 0 && end != 0) {
            sql += "and discount between " + from + " and " + end + "  ";
        }
        if (end == 0 && from != 0) {
            sql += "and discount > " + from;
        }
        if (option == 1) {
            sql += " order by discount";
        } else if (option == 2) {
            sql += " order by discount desc";
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
               List<String> image = getImagesbyLaptopId(rs.getInt("id"));
                lp.setImage(image);
                lp.setDescription(rs.getNString("description"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Laptop> getLaptopByManufacturerId(int manuId, int option) {
        List<Laptop> list = new ArrayList<>();
        String sql = "select * from Laptop where 1=1";
        if (manuId != 0) {
            sql += "and manufacturerId =" + manuId;
        }
        if (option == 1) {
            sql += " order by discount";
        } else if (option == 2) {
            sql += " order by discount desc";
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
               List<String> image = getImagesbyLaptopId(rs.getInt("id"));
                lp.setImage(image);
                lp.setDescription(rs.getNString("description"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Laptop getLaptopbyLaptopId(int id) {
        String sql = "Select * from [Laptop]  where id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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
               List<String> image = getImagesbyLaptopId(rs.getInt("id"));
                lp.setImage(image);
                lp.setDescription(rs.getNString("description"));
                lp.setWeight(rs.getFloat("weight"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                return lp;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        LaptopDAO l = new LaptopDAO();
        Laptop  list = l.getLaptopbyLaptopId(1);
        System.out.println(list.getImage().get(2));
    }
}
