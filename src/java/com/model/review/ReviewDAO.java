/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.review;

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
public class ReviewDAO extends DBUtils {

    public void addReview(int customerId, int laptopId, float review, String detail) {
        LocalDate currentDate = java.time.LocalDate.now();
        String date = currentDate.toString();
        String sql = "INSERT INTO [dbo].[reviews]\n"
                + "           ([customerId]\n"
                + "           ,[laptopId]\n"
                + "           ,[review]\n"
                + "           ,[reviewDate]\n"
                + "           ,[details])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            st.setInt(2, laptopId);
            st.setFloat(3, review);
            st.setString(4, date);
            st.setNString(5, detail);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Review> getReviewBylaptopId(int id) {
        List<Review> list = new ArrayList<>();
        String sql = "select * from reviews where laptopId=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Review rev = new Review();
                rev.setId(rs.getInt("id"));
                rev.setLaptopId(rs.getInt("laptopId"));
                rev.setCustomerId(rs.getInt("customerId"));
                rev.setReviewDate(rs.getString("reviewDate"));
                rev.setReview(rs.getInt("review"));
                rev.setDetails(rs.getString("details"));
                list.add(rev);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public float getReviewAverageByLaptop(int laptopId) {
        float avg = 0;
        String sql = "select * from reviews where laptopId=" + laptopId;
        List<Float> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getFloat("review"));
            }
        } catch (SQLException e) {
        }
        for (int i = 0; i < list.size(); i++) {
            avg += list.get(i);
        }
        avg= avg/list.size();
        return avg;
    }

    public static void main(String[] args) {
        ReviewDAO r = new ReviewDAO();
        r.addReview(1, 16, 3, "jhhii");
        System.out.println(r.getReviewBylaptopId(16).get(0).getLaptopId());
    }
}
