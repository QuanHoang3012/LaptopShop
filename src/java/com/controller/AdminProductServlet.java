/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.laptop.Laptop;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class AdminProductServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProductServlet at " + request.getContextPath() + "</h1>");
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
        List<Laptop> list = WebController.getInstance().laptopdao.getAll();
        String href = "";
        String key = request.getParameter("search");
               String action = request.getParameter("action");
        String laptopId_raw = request.getParameter("laptopId");
        String alert ="";
        if (key != null) {
            list = WebController.getInstance().laptopdao.searchByName(key, 1);
            href += "search=" + key;
        }
       if(action!=null){
            if(action.equals("delete")){
            int laptopId = Integer.parseInt(laptopId_raw);
            WebController.getInstance().laptopdao.deleteImageByLaptopId(laptopId);
            boolean result = WebController.getInstance().laptopdao.deleteLaptopById(laptopId);
            if(result){
                list = WebController.getInstance().laptopdao.getAll();
                alert = "Delete successful";
            }else alert="Delete failed";
            }   
       }
        /////        this is paging process
        int size = list.size();
        int page, numOfProduct = 12;
        int numOfPage = (size % 12 == 0 ? (size / 12) : (size / 12) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numOfProduct;
        end = Math.min(page * numOfProduct, size);
        List<Laptop> listP = WebController.getInstance().laptopdao.getListByPage(list, start, end);
        /////////////////////  end paging process
        request.setAttribute("alert", alert);
        request.setAttribute("href", href);
        request.setAttribute("product", listP);
        request.setAttribute("page", page);
        request.setAttribute("num", numOfPage);
        request.getRequestDispatcher("adminProduct.jsp").forward(request, response);
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
        processRequest(request, response);
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
