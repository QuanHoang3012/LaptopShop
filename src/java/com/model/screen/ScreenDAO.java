/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.screen;

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
public class ScreenDAO extends DBUtils {

    public List<Screen> getAll() {
        List<Screen> list = new ArrayList<>();
        String sql = "Select * from screen";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Screen m = new Screen(rs.getInt("id"), rs.getString("detail"));
                list.add(m);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean deleteScreen(int id) {
        String sql = "DELETE FROM [dbo].[screen]\n"
                + "      WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean insertScreen(String name) {
        String sql = "INSERT INTO [dbo].[screen]\n"
                + "           ([detail])\n"
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

    public Screen getScreenbyId(int id) {
        List<Screen> list = new ArrayList<>();
        String sql = "Select * from  [Laptop_Shop].[dbo].[screen] where 1=1";
        if (id != 0) {
            sql += "and id=" + id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Screen m = new Screen(rs.getInt("id"), rs.getString("detail"));
                return m;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
