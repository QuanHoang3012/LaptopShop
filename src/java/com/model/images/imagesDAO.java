/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.images;

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
public class imagesDAO extends DBUtils{
    public images getImagesbyId (int laptopId){
        List<images> list = new ArrayList<>();
        String sql="Select * from  [Laptop_Shop].[dbo].[images] where laptopId="+laptopId;
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
              while(rs.next()){
                images m = new images(rs.getString("href"));
                    return m;
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
