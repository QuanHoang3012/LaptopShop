/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.manufacturer;

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
public class ManufacturerDAO extends DBUtils {

    public List<Manufacturer> getAll() {
        List<Manufacturer> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "  FROM [Laptop_Shop].[dbo].[manufacturer]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Manufacturer m = new Manufacturer(rs.getInt("id"), rs.getString("name"));
                list.add(m);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean deleteManufacturer(int id) {
        String sql = "DELETE FROM [dbo].[manufacturer]\n"
                + "      WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean insertManufacturer(String name) {
        String sql = "INSERT INTO [dbo].[manufacturer]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public Manufacturer getManufacturerbyId(int id) {
        List<Manufacturer> list = new ArrayList<>();
        String sql = "Select * from  [Laptop_Shop].[dbo].[manufacturer] where 1=1";
        if (id != 0) {
            sql += "and id=" + id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Manufacturer m = new Manufacturer(rs.getInt("id"), rs.getString("name"));
                return m;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int getManufacturerQuantity(int id) {
        int stock = 0;
        String sql = "select Sum(stock) as quantity from Laptop l join manufacturer m on l.manufacturerId = m.id where 1=1";
        if (id != 0) {
            sql += "and m.id =" + id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                stock = rs.getInt("quantity");
            }
            return stock;
        } catch (SQLException e) {
        }
        return 0;
    }

}
