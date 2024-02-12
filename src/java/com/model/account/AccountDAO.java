/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.account;

import com.model.utils.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Anh Quan
 */
public class AccountDAO extends DBUtils {

    public Account checkAccount(String username, String password) {
        String sql = "select * from accounts where [username] =? and [password] =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Account acc = new Account();
                acc.setId(rs.getInt("id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhoneNumber(rs.getString("phonenNumber"));
                acc.setGender(rs.getString("gender"));
                acc.setEmail(rs.getString("email"));
                acc.setImage(rs.getString("image"));
                acc.setBirthday(rs.getDate("birthday"));
                acc.setRole(rs.getInt("role"));
                return acc;
                
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        AccountDAO acb = new AccountDAO();
        Account a = acb.checkAccount("john_doe", "password123");
        System.out.println(a.getFullname());
    }
}
