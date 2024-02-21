/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.address;

import com.model.account.Account;
import com.model.utils.DBUtils;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Anh Quan
 */
public class AddressDAO extends DBUtils {

    private boolean addAddres(Account account, String name, String address) {
        String sql = "INSERT INTO [dbo].[customer_address]\n"
                + "           ([customer]\n"
                + "		   ,[name]\n"
                + "           ,[address])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account.getId());
            st.setString(2, name);
            st.setString(3, address);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    private boolean updateAdress(int id, String name, String address) {
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

    private boolean deleteAdress(String id) {
        String sql = "DELETE FROM [dbo].[customer_address]\n"
                + "      WHERE id=" + id;
          try {
            PreparedStatement st = connection.prepareStatement(sql);         
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }
}
