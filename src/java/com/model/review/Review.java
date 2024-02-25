/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.review;

/**
 *
 * @author Anh Quan
 */
public class Review {
    private int id;
    private int customerId;
    private int laptopId;
    private float review;
    private  String reviewDate;
    private String details;

    public Review() {
    }

    public Review(int id, int customerId, int laptopId, float review, String reviewDate, String details) {
        this.id = id;
        this.customerId = customerId;
        this.laptopId = laptopId;
        this.review = review;
        this.reviewDate = reviewDate;
        this.details = details;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(int laptopId) {
        this.laptopId = laptopId;
    }

    public float getReview() {
        return review;
    }

    public void setReview(float review) {
        this.review = review;
    }

    public String getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(String reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
    
    
}
