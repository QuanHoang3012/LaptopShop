/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.order;

import com.model.account.Account;
import com.model.cart.Cart;
import com.model.item.Item;
import com.model.utils.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author Anh Quan
 */
public class OrderDAO extends DBUtils{
    public void addOrder(Account account, Cart cart){
        LocalDate currentDate = java.time.LocalDate.now();
        String date = currentDate.toString();
        try {
            String sql = "insert into [Order] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, account.getId());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            String sql1 = "select top 1 from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet resultSet = st1.executeQuery();
            //// add to orderdetail
            if(resultSet.next()){
                int orderId = resultSet.getInt("orderId");
                for(Item item : cart.getItems()){
                    String sql2 ="insert into [OrderDetail] values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderId);
                    st2.setInt(2, item.getLaptop().getId());
                    st2.setInt(3, item.getQuantity());
                    st2.setDouble(4, item.getPrice());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
        }
    }
    
    
    
    
}
