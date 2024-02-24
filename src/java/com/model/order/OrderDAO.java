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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class OrderDAO extends DBUtils {

    public boolean addOrder(Account account, Cart cart, int addressId) {
        LocalDate currentDate = java.time.LocalDate.now();
        String date = currentDate.toString();
        try {
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "           ([customer]\n"
                    + "           ,[date]\n"
                    + "           ,[status]\n"
                    + "           ,[price]\n"
                    + "           ,[address])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
             st.setInt(1, account.getId());
            st.setString(2, date);          
            st.setString(3, "Đang xử lý đơn hàng");
            st.setDouble(4, cart.getTotalMoney());
            st.setInt(5, addressId);
            st.executeUpdate();
            String sql1 = "select top 1 id from [order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet resultSet = st1.executeQuery();
            //// add to orderdetail
            if (resultSet.next()) {
                int orderId = resultSet.getInt(1);
                for (Item item : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[orderdetail]\n"
                            + "           ([laptopId]\n"
                            + "           ,[orderId]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                     st2.setInt(1, item.getLaptop().getId());
                    st2.setInt(2, orderId);
                    st2.setInt(3, item.getQuantity());
                    st2.setDouble(4, item.getPrice());
                    st2.executeUpdate();
                }
              
            }
            return true;
        } catch (SQLException e) {
        }
        return false;
    }
    
    public List<Order> getOrderByOrderId(int id){
        List<Order> list = new ArrayList<>();
        String sql="Select * from [order] where id="+id;
        try {
             PreparedStatement st = connection.prepareStatement(sql);
               ResultSet rs = st.executeQuery();
               while(rs.next()){
                   Order order = new Order();
                   order.setId(rs.getInt("id"));
                   order.setCustomerId(rs.getInt("customer"));
                   order.setDate(rs.getDate("date"));
                   order.setStatus(rs.getString("status"));
                   order.setAddress(rs.getInt("address"));
                   order.setTotalMoney(rs.getDouble("price"));
                   list.add(order);
               }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Order> getOrderForCustomer(int accountId, String status){
        List<Order> list = new ArrayList<>();
        String sql="select * from [order] where customer = "+accountId+" and status like N'%"+status+"%' order by id desc";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
               ResultSet rs = st.executeQuery();
               while(rs.next()){
                   Order order = new Order();
                   order.setId(rs.getInt("id"));
                   order.setCustomerId(rs.getInt("customer"));
                   order.setDate(rs.getDate("date"));
                   order.setStatus(rs.getString("status"));
                   order.setAddress(rs.getInt("address"));
                   order.setTotalMoney(rs.getDouble("price"));
                   list.add(order);
               }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        List<Order> list = o.getOrderForCustomer(1, "Đang");
        System.out.println(list.get(0).getCustomerId());
    }

}
