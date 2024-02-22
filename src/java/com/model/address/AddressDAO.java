/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.address;

import com.controller.WebController;
import com.model.account.Account;
import com.model.account.AccountDAO;
import com.model.cpu.Cpu;
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
public class AddressDAO extends DBUtils {

    public boolean addAddres(Account account, String name, String phone, String address) {
        String sql = "INSERT INTO [dbo].[customer_address]\n"
                + "           ([customer]\n"
                + "            ,[name]\n"
                + "             ,[phone]\n"
                + "           ,[address])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account.getId());
            st.setString(2, name);
            st.setString(3, phone);
            st.setString(4, address);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean updateAdress(int id, String name, String address) {
        String sql = "UPDATE [dbo].[customer_address]\n"
                + "   SET [name]= ?\n"
                + "      ,[address] =?\n"
                + " WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public void deleteAdress(int id) {
        String sql = "DELETE FROM [dbo].[customer_address]\n"
                + "      WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<Address> getAllAddressByAccount(int accountId){
        List<Address> list = new ArrayList<>();
        AccountDAO adb =new AccountDAO();
        String sql="Select * from [customer_address] where customer= "+accountId;
         try {
            PreparedStatement st = connection.prepareStatement(sql);
              ResultSet rs = st.executeQuery();
            while(rs.next()){
               Address a = new Address();
               a.setId(rs.getInt("id"));
               Account account = adb.getAccountById(rs.getInt("customer"));
               a.setAccount(account);
               a.setName(rs.getNString("name"));
               a.setPhone(rs.getString("phone"));
               a.setAddress(rs.getString("address"));
                list.add(a);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public static void main(String[] args) {
        AddressDAO a = new AddressDAO();
        List<Address> ad =a.getAllAddressByAccount(1);
       for(Address i : ad){
           System.out.println(i.getAddress());
       }
    }
}
