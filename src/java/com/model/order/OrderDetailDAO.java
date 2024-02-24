/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.order;

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
public class OrderDetailDAO extends DBUtils{
    public List<OrderDetail> getOrderDetailByOrderId(int orderId){
        List<OrderDetail> list = new ArrayList();
        String sql="Select * from [orderdetail] where orderId= "+orderId;
        try {
             PreparedStatement st = connection.prepareStatement(sql);
               ResultSet rs = st.executeQuery();
               while(rs.next()){
                   OrderDetail  order = new OrderDetail();
                   order.setLaptopId(rs.getInt("laptopId"));
                   order.setOrderId(rs.getInt("orderId"));
                   order.setQuantity(rs.getInt("quantity"));
                   order.setPrice(rs.getDouble("price"));
                   list.add(order);
               }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        OrderDetailDAO o = new OrderDetailDAO();
      
    }
}
