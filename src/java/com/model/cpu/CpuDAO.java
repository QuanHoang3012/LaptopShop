/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.cpu;

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
public class CpuDAO extends DBUtils {

    public List<Cpu> getAll() {
        List<Cpu> list = new ArrayList<>();
        String sql = "Select * from cpu";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cpu m = new Cpu(rs.getInt("id"), rs.getString("name"));
                list.add(m);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean deleteCpu(int id) {
        String sql = "DELETE FROM [dbo].[cpu]\n"
                + "      WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean insertCpu(String name) {
        String sql = "INSERT INTO [dbo].[cpu]\n"
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

    public Cpu getCpubyId(int id) {
        List<Cpu> list = new ArrayList<>();
        String sql = "Select * from  [Laptop_Shop].[dbo].[cpu] where 1=1";
        if (id != 0) {
            sql += "and id=" + id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cpu m = new Cpu(rs.getInt("id"), rs.getString("name"));
                return m;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
