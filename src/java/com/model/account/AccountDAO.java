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

    public Account getAccount(String username, String password) {
        String sql = "select * from accounts where [username] =? and [password] =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhoneNumber(rs.getString("phoneNumber"));
                acc.setGender(rs.getInt("gender"));
                acc.setEmail(rs.getString("email"));
                acc.setImage(rs.getString("image"));
                acc.setBirthday(rs.getString("birthday"));
                acc.setRole(rs.getInt("role"));
                return acc;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountById(int id) {
        String sql = "select * from accounts where id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhoneNumber(rs.getString("phoneNumber"));
                acc.setGender(rs.getInt("gender"));
                acc.setEmail(rs.getString("email"));
                acc.setImage(rs.getString("image"));
                acc.setBirthday(rs.getString("birthday"));
                acc.setRole(rs.getInt("role"));
                return acc;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean updateAccountById(int id, String fullname, String phoneNumber, String email, int gender, String birthday, String image) {
        String sql = "UPDATE [dbo].[accounts]\n"
                + "   SET [fullName] =?\n"
                + "      ,[phoneNumber] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[birthday] =?\n"
                + "      ,[image] =?\n"
                + " WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, phoneNumber);
            st.setString(3, email);
            st.setInt(4, gender);
            st.setString(5, birthday);
            st.setString(6, image);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean updatePassword(int id, String password) {
        String sql = "UPDATE [dbo].[accounts]\n"
                + "   SET [password] =?\n"
                + " WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean checkUsername(String username) {
        String sql = "select * from [dbo].[accounts] where username='" + username + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean createAccount(String username, String password, String email, String name, String phone, int role) {
        String sql = "INSERT INTO [dbo].[accounts]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[fullName]\n"
                + "           ,[phoneNumber]\n"
                + "             ,[role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, name);
            st.setString(5, phone);
            st.setInt(6, role);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO acb = new AccountDAO();
        Account a = acb.getAccount("john_doe", "password123");
        System.out.println(a.getFullname());
    }
}
