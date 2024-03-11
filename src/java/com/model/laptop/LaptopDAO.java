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
    
    public int numberOfProduct(){
        String sql="select count(*) from laptop ";
        try {
               PreparedStatement st = connection.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                if(rs.next()){
                    return rs.getInt(1);
                }
        } catch (Exception e) {
        }
        return 0;
    }
    public void updateStock(int id,int stock) {
        String sql = "update laptop\n"
                + "set stock =?\n"
                + "where id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stock);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getLastLaptopIdAdded() {
        String sql = "SELECT top 1 id\n"
                + "  FROM [dbo].[Laptop]\n"
                + "  order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void updateImagebyLaptopId(int id, String newHref, String oldHref) {
        String sql = "UPDATE [dbo].[images]\n"
                + "   SET [href] = ?\n"
                + " WHERE laptopId=" + id + " and href = '" + oldHref + "' ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newHref);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertImageByLaptopId(int id, String href) {
        String sql = "INSERT INTO [dbo].[images]\n"
                + "           ([href]\n"
                + "           ,[laptopId])\n"
                + "     VALUES\n"
                + "           (? ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, href);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

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

    public String getImageForUser(int id) {
        String sql = "Select * from  [Laptop_Shop].[dbo].[accounts] where id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("image");
            }
        } catch (SQLException e) {
        }
        return null;
    }
      public List<Laptop> getAll() {
        List<Laptop> list = new ArrayList<>();
        String sql = "Select * from [Laptop] order by stock asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Laptop lp = new Laptop();
                lp.setId(rs.getInt("id"));
                lp.setName(rs.getString("name"));
                lp.setInPrice(rs.getDouble("inPrice"));
                lp.setOutPrice(rs.getDouble("outPrice"));
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
                lp.setReleaseYear(rs.getString("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));                
                lp.setDescription(rs.getNString("description"));
                lp.setWeight(rs.getFloat("weight"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
            System.out.println(e);
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
                lp.setOutPrice(rs.getDouble("outPrice"));
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
                lp.setReleaseYear(rs.getString("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));                
                lp.setDescription(rs.getNString("description"));
                lp.setWeight(rs.getFloat("weight"));
                Manufacturer m = mdb.getManufacturerbyId(rs.getInt("manufacturerId"));
                lp.setManufacturer(m);
                list.add(lp);
            }
        } catch (SQLException e) {
            System.out.println(e);
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
                lp.setOutPrice(rs.getDouble("outPrice"));
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
                lp.setReleaseYear(rs.getString("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));
                lp.setWeight(rs.getFloat("weight"));
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
                lp.setOutPrice(rs.getDouble("outPrice"));
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
                lp.setReleaseYear(rs.getString("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));
                lp.setWeight(rs.getFloat("weight"));
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
                lp.setOutPrice(rs.getDouble("outPrice"));
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
                lp.setReleaseYear(rs.getString("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));
                lp.setWeight(rs.getFloat("weight"));
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
                lp.setOutPrice(rs.getDouble("outPrice"));
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
                lp.setReleaseYear(rs.getString("releaseYear"));
                lp.setOrigin(rs.getString("origin"));
                lp.setDiscount(rs.getDouble("discount"));
                lp.setSystem(rs.getString("system"));
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

    public List<Laptop> getLaptopBestSeller() {
        List<Laptop> list = new ArrayList<>();
        List<Integer> laptop = new ArrayList<>();
        String sql = "select top 8 laptopId ,count(*) from [dbo].[orderdetail]\n"
                + "group by laptopId\n"
                + "order by count(*) desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int i = 0;
            while (rs.next()) {
                laptop.add(rs.getInt(1));
                i++;
            }
            for (int y = 0; y < laptop.size(); y++) {
                list.add(getLaptopbyLaptopId(laptop.get(y)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void deleteImageByLaptopId(int id) {
        String sql = "DELETE FROM [dbo].[images]\n"
                + "      WHERE laptopId=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean deleteLaptopById(int id) {
        String sql = "DELETE FROM [dbo].[Laptop]\n"
                + "WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean updateLaptop(int laptopId, String name, double inPrice, double outPrice, int stock, int screenId, int cpuId, int ramId, int ssdId, String card, String releaseYear, String origin, double discount, String system, int manufacturerId, double weight, String description) {
        String sql = "UPDATE [dbo].[Laptop]\n"
                + "   SET [name] = ?\n"
                + "      ,[inPrice] = ?\n"
                + "      ,[outPrice] = ?\n"
                + "      ,[stock] = ?\n"
                + "      ,[screenId] = ?\n"
                + "      ,[cpuId] = ?\n"
                + "      ,[ramId] = ?\n"
                + "      ,[ssdId] = ?\n"
                + "      ,[card] = ?\n"
                + "      ,[releaseyear] = ?\n"
                + "      ,[origin] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[system] = ?\n"
                + "      ,[weight] = ?\n"
                + "      ,[manufacturerId] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id=" + laptopId;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, inPrice);
            st.setDouble(3, outPrice);
            st.setInt(4, stock);
            st.setInt(5, screenId);
            st.setInt(6, cpuId);
            st.setInt(7, ramId);
            st.setInt(8, ssdId);
            st.setString(9, card);
            st.setString(10, releaseYear);
            st.setString(11, origin);
            st.setDouble(12, discount);
            st.setString(13, system);
            st.setInt(15, manufacturerId);
            st.setDouble(14, weight);
            st.setString(16, description);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean insertLaptop(String name, float inPrice, float outPrice, int stock, int screenId, int cpuId, int ramId, int ssdId, String card, String releaseYear, String origin, float discount, String system, int manufacturerId, double weight, String description) {
        String sql = "INSERT INTO [Laptop]\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setFloat(2, inPrice);
            st.setFloat(3, outPrice);
            st.setInt(4, stock);
            st.setInt(5, screenId);
            st.setInt(6, cpuId);
            st.setInt(7, ramId);
            st.setInt(8, ssdId);
            st.setString(9, card);
            st.setString(10, releaseYear);
            st.setString(11, origin);
            st.setFloat(12, discount);
            st.setString(13, system);
            st.setDouble(14, weight);
            st.setInt(15, manufacturerId);
            st.setString(16, description);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public static void main(String[] args) {
        LaptopDAO l = new LaptopDAO();
        List<String> laptop = l.getImagesbyLaptopId(1);
        List<Laptop> list = l.getAllLaptop(1);
        System.out.println(l.numberOfProduct());
    }
}
