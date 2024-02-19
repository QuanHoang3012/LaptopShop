/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.cart.Cart;
import com.model.item.Item;
import com.model.laptop.Laptop;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class ProcessServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart =null;
        Object o = session.getAttribute("cart");
        if(o!= null){
            cart = (Cart) o;
        }else {
            cart = new Cart();
        }
           String quantityLaptop_raw = request.getParameter("quantityLaptop").trim();
        String laptopId_raw= request.getParameter("id");
        try {
            int quantityLaptop = Integer.parseInt(quantityLaptop_raw);
            int laptopId = Integer.parseInt(laptopId_raw);
            if(quantityLaptop==-1 && cart.getQuantitById(laptopId)<=1){
                cart.removeItem(laptopId);
            }else {
                 Laptop laptop = WebController.getInstance().laptopdao.getLaptopbyLaptopId(laptopId);
            Item item = new Item(laptop, quantityLaptop, laptop.getDiscount());     
            cart.addItem(item);
            }
        } catch (NumberFormatException e) {
        }         
        List<Item> listItem = cart.getItems();
          session.setAttribute("cart", cart);
        session.setAttribute("size", listItem.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart =null;
        Object o = session.getAttribute("cart");
        if(o!= null){
            cart = (Cart) o;
        }else {
            cart = new Cart();
        }
          String laptopId_raw= request.getParameter("id");
          int id = Integer.parseInt(laptopId_raw);
          cart.removeItem(id);
          List<Item> listItem = cart.getItems();
          session.setAttribute("cart", cart);
        session.setAttribute("size", listItem.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
