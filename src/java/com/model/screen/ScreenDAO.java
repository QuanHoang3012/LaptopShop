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
public class ScreenDAO extends DBUtils{
     public List<Screen> getAll() {
        List<Screen> list = new ArrayList<>();
        String sql = "Select * from screen";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Screen m = new Screen(rs.getInt("id"), rs.getString("detail"));
                list.add(m);
            }
        } catch (SQLException e) {
        }
        return list;
    }
     
      public  Screen getScreenbyId(int id){
        List<Screen> list = new ArrayList<>();
        String sql="Select * from  [Laptop_Shop].[dbo].[screen] where 1=1";
        if(id!=0) {
            sql += "and id="+id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
              while(rs.next()){
                Screen m = new Screen(rs.getInt("id"), rs.getString("detail"));
               return m;
            }
        } catch (SQLException e) {
        }
        return null;
    }
     

}
